pub fn display(system: &sysinfo::System) -> String {
    let cpus = system.cpus();
    let total: f32 = system.cpus().iter().map(|cpu| cpu.cpu_usage()).sum();
    let average = total / cpus.len() as f32;
    return format!(" {:>3.0}%", average);
}
