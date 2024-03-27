use std::io::{self, Write};
use std::thread;
use std::time::{Duration, Instant};

mod components;

fn main() {
    let mut system_info = sysinfo::System::new();
    let cpu_refresh = sysinfo::CpuRefreshKind::new().with_cpu_usage();
    let memory_refresh = sysinfo::MemoryRefreshKind::new().with_ram();

    loop {
        let i = Instant::now();
        let now = chrono::Local::now();

        system_info.refresh_cpu_specifics(cpu_refresh);
        system_info.refresh_memory_specifics(memory_refresh);

        // Sleep for some time before updating the status again
        thread::sleep(Duration::from_millis(50));

        // Add all the components into one formatted string
        let status = format!(
            "{} | {} | {} | {} | {} | {} | {} | {} | {}",
            components::song::display(),
            components::volume::display(),
            components::brightness::display(),
            components::battery::display(),
            components::cpu::display(&system_info),
            components::memory::display(&system_info),
            components::date::display(&now),
            components::time::display(&now),
            components::rate::display(&i),
        );

        // Print the status to stdout
        println!("{}", status);

        // Flush stdout to ensure the status is immediately visible
        if let Err(err) = io::stdout().flush() {
            println!("Error during stdout flush: {}", err)
        }
    }
}
