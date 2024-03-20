use chrono::{DateTime, Local};
use std::io::{self, Write};
use std::thread;
use std::time::Duration;
use sys_info::{self};

fn main() {
    if let Ok(manager) = battery::Manager::new() {
        loop {
            let status = format!("{} | {} | {}", memory(), battery(&manager), clock());

            // Print the status to STDOUT
            println!("{}", status);

            // Flush stdout to ensure the status is immediately visible
            io::stdout().flush().unwrap();

            // Sleep for some time before updating the status again
            thread::sleep(Duration::from_secs(1));
        }
    }
}

fn clock() -> DateTime<Local> {
    return Local::now();
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
