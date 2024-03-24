use std::io::{self, Write};
use std::thread;
use std::time::Duration;

mod components;

fn main() {
    let mut system_info = sysinfo::System::new();
    let battery_info = battery::Manager::new().unwrap();

    loop {
        system_info.refresh_memory();
        system_info.refresh_cpu();

        let now = chrono::Local::now();

        // Add all the components into one formatted string
        let status = format!(
            "{} | {} | {} | {} | {} | {}",
            components::volume::display(),
            components::cpu::display(&system_info),
            components::memory::display(&system_info),
            components::battery::display(&battery_info),
            components::date::display(&now),
            components::time::display(&now)
        );

        // Print the status to stdout
        println!("{}", status);

        // Flush stdout to ensure the status is immediately visible
        if let Err(err) = io::stdout().flush() {
            println!("Error during stdout flush: {}", err)
        }

        // Sleep for some time before updating the status again
        thread::sleep(Duration::from_secs(1));
    }
}
