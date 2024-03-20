use std::io::{self, Write};
use std::thread;
use std::time::Duration;

fn main() {
    let mut system_info = sysinfo::System::new();
    let battery_info = battery::Manager::new().unwrap();

    loop {
        system_info.refresh_memory();
        system_info.refresh_cpu();

        // Add all the components into one formatted string
        let status = format!(
            "{} | {} | {} | {}",
            cpu(&system_info),
            memory(&system_info),
            battery(&battery_info),
            clock()
        );

        // Print the status to stdout
        println!("{}", status);

        // Flush stdout to ensure the status is immediately visible
        io::stdout().flush().unwrap();

        // Sleep for some time before updating the status again
        thread::sleep(Duration::from_secs(1));
    }
}

fn clock() -> String {
    let now = chrono::Local::now().format("%a %e %b %H:%M:%S").to_string();
    return format!(" {}", now);
}

fn battery(manager: &battery::Manager) -> String {
    if let Ok(mut batteries) = manager.batteries() {
        if let Some(Ok(battery)) = batteries.next() {
            let percentage = battery.state_of_charge().value * 100.0;
            return format!(" {}%", percentage.floor());
        }
    }

    return String::from("-");
}

fn memory(system: &sysinfo::System) -> String {
    let total = system.total_memory() / 1000_000_000;
    let used = system.used_memory() as f64 / 1000_000_000.0;
    return format!(" {:.2} / {} GB", used, total);
}

fn cpu(system: &sysinfo::System) -> String {
    let total: f32 = system.cpus().iter().map(|cpu| cpu.cpu_usage()).sum();
    return format!(" {:.2}%", total);
}
