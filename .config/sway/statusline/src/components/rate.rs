use std::time::Instant;

pub fn display(i: &Instant) -> String {
    return format!("{:>3.2}ms", i.elapsed().as_millis());
}
