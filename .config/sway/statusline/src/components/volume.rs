use super::utils;

pub fn display() -> String {
    let volume = get_volume();
    let muted = is_muted();
    let icon = get_icon(volume);
    let style = get_style(muted);
    return format!("<span {}>{} {:>3}%</span>", style, icon, volume);
}

fn get_icon(volume: i32) -> String {
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
        return String::from("alpha=\"50%\"");
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
