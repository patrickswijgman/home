use std::process::Command;

pub fn display() -> String {
    let volume = get_volume();
    let muted = is_muted();
    let icon = get_icon(muted);
    let style = get_style(muted);
    return format!("<span {}>{} {}%</span>", style, icon, volume);
}

fn get_icon(muted: bool) -> String {
    if muted {
        return String::from("");
    }

    return String::from("");
}

fn get_style(muted: bool) -> String {
    if muted {
        return String::from("color=\"red\"");
    }

    return String::from("");
}

fn get_volume() -> String {
    if let Ok(output) = Command::new("pamixer").arg("--get-volume").output() {
        if output.status.success() {
            return String::from_utf8_lossy(&output.stdout).trim().to_string();
        }
    }

    return String::from("-");
}

fn is_muted() -> bool {
    if let Ok(output) = Command::new("pamixer").arg("--get-mute").output() {
        if output.status.success() {
            return String::from_utf8_lossy(&output.stdout).trim().to_string() == "true";
        }
    }

    return false;
}
