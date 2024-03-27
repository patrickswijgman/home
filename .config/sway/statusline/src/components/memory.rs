pub fn display(system: &sysinfo::System) -> String {
    let total = system.total_memory() / 1_000_000_000;
    let used = system.used_memory() as f64 / 1_000_000_000.0;
    return format!(" {:>4.1}/{} GB", used, total);
}
