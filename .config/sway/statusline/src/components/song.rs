use super::utils;

pub fn display() -> String {
    let title = get_title();
    let artist = get_artist();
    let paused = is_paused();
    let style = get_style(paused);
    return format!("<span {}> {} - {}</span>", style, title, artist);
}

fn get_style(paused: bool) -> String {
    if paused {
        return String::from("alpha=\"50%\"");
    }

    return String::from("");
}

fn get_title() -> String {
    return utils::escape(&utils::cmd("playerctl metadata xesam:title"));
}

fn get_artist() -> String {
    return utils::escape(&utils::cmd("playerctl metadata xesam:artist"));
}

fn is_paused() -> bool {
    return utils::cmd("playerctl status") == "Paused";
}
