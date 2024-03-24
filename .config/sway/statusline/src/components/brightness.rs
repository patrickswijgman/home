use super::utils;

pub fn display() -> String {
    let c = get_current();
    let m = get_max();
    let p = (c / m) * 100.0;
    return format!(" {:.0}%", p);
}

fn get_current() -> f32 {
    if let Ok(value) = utils::cmd("brightnessctl get").parse() {
        return value;
    }

    return -1.0;
}

fn get_max() -> f32 {
    if let Ok(value) = utils::cmd("brightnessctl max").parse() {
        return value;
    }

    return -1.0;
}
