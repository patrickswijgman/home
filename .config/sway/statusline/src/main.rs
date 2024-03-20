use std::io::{self, Write};
use std::thread;
use std::time::Duration;

fn main() {
    if let Ok(manager) = battery::Manager::new() {
        loop {
            // Add all the components into one formatted string
            let status = format!("{} | {} | {}", memory(), battery(&manager), clock());

            // Print the status to stdout
            println!("{}", status);

            // Flush stdout to ensure the status is immediately visible
            io::stdout().flush().unwrap();

            // Sleep for some time before updating the status again
            thread::sleep(Duration::from_secs(1));
        }
    }
}

fn clock() -> String {
    return chrono::Local::now().format("%a %e %b %H:%M:%S").to_string();
}

fn battery(manager: &battery::Manager) -> String {
    if let Ok(mut batteries) = manager.batteries() {
        if let Some(Ok(battery)) = batteries.next() {
            let percentage = battery.state_of_charge().value * 100.0;
            return format!("BAT: {}%", percentage.floor());
        }
    }

    return String::from("-");
}

fn memory() -> String {
    if let Ok(memory) = sys_info::mem_info() {
        let total = memory.total / 1000_000;
        let in_use = (memory.total - memory.avail) as f32 / 1000_000.0;
        return format!("MEM: {:.2} / {} GB", in_use, total);
    }

    return String::from("-");
}
