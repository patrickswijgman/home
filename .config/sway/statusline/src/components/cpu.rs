pub fn display(system: &sysinfo::System) -> String {
    let total: f32 = system.cpus().iter().map(|cpu| cpu.cpu_usage()).sum();
    return format!(" {:.0}%", total);
}
