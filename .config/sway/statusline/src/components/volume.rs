use super::utils;

pub fn display() -> String {
    let volume = get_volume();
    let muted = is_muted();
    let icon = get_icon(muted, volume);
    let style = get_style(muted);
    return format!("<span {}>{} {}%</span>", style, icon, volume);
}

fn get_icon(muted: bool, volume: i32) -> String {
    if muted {
        return String::from("");
    }

    if volume == 0 {
        return String::from("");
    }
    if volume < 50 {
        return String::from("");
    }

    return String::from("");
}

fn get_style(muted: bool) -> String {
    if muted {
        return String::from("color=\"red\"");
    }

    return String::from("");
}

fn get_volume() -> i32 {
    if let Ok(volume) = utils::cmd("pamixer --get-volume").parse() {
        return volume;
    }

    return -1;
}

fn is_muted() -> bool {
    return utils::cmd("pamixer --get-mute") == "true";
}
