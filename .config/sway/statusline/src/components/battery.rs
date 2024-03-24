pub fn display(manager: &battery::Manager) -> String {
    if let Ok(mut batteries) = manager.batteries() {
        if let Some(Ok(battery)) = batteries.next() {
            let charge = battery.state_of_charge().value * 100.0;
            let state = battery.state();
            let icon = get_icon(state, charge);
            let style = get_style(charge);
            return format!("<span {}>{} {}%</span>", style, icon, charge.floor());
        }
    }

    return String::from("-");
}

fn get_icon(state: battery::State, charge: f32) -> String {
    if state == battery::State::Charging {
        return String::from("");
    }

    if charge <= 25.0 {
        return String::from("");
    }
    if charge <= 50.0 {
        return String::from("");
    }
    if charge <= 75.0 {
        return String::from("");
    }
    if charge <= 100.0 {
        return String::from("");
    }

    return String::from("");
}

fn get_style(charge: f32) -> String {
    if charge <= 20.0 {
        return String::from("color=\"red\"");
    }

    return String::from("");
}
