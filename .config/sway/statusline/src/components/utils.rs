use std::process::Command;

pub fn cmd(command: &str) -> String {
    let mut parts = command.split_whitespace();
    let program = parts.next();

    if let Some(program) = program {
        let args: Vec<&str> = parts.collect();

        if let Ok(output) = Command::new(program).args(args).output() {
            if output.status.success() {
                return String::from_utf8_lossy(&output.stdout).trim().to_string();
            }
        }
    }

    return String::from("");
}
