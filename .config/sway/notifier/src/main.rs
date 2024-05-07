use notify_rust::Notification;
use std::thread;
use std::time::Duration;

fn main() {
    loop {
        thread::sleep(Duration::from_secs(1200)); // 20 minutes in seconds

        let _ = Notification::new()
            .summary("Break notifier")
            .body("Avert thine eyes from the screen for 20 seconds!")
            .show();
    }
}
