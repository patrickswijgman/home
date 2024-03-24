use chrono::{DateTime, Local};

pub fn display(now: &DateTime<Local>) -> String {
    return format!(" {}", now.format("%a %e %b"));
}
