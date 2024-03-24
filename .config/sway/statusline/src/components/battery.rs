use super::utils;

pub fn display() -> String {
    let capacity = get_capacity();
    let status = get_status();
    let icon = get_icon(status, capacity);
    let style = get_style(capacity);
    return format!("<span {}>{} {:02.0}%</span>", style, icon, capacity);
}

fn get_icon(status: String, capacity: i32) -> String {
    if status == "Charging" {
        return String::from("");
    }

    if capacity <= 25 {
        return String::from("");
    }
    if capacity <= 50 {
        return String::from("");
    }
    if capacity <= 75 {
        return String::from("");
    }

    return String::from("");
}

fn get_style(capacity: i32) -> String {
    if capacity <= 20 {
        return String::from("color=\"red\"");
    }

    return String::from("");
}

fn get_capacity() -> i32 {
    if let Ok(capacity) = utils::cmd("cat /sys/class/power_supply/BAT0/capacity").parse() {
        return capacity;
    }

    return -1;
}

fn get_status() -> String {
    return utils::cmd("cat /sys/class/power_supply/BAT0/status");
}
