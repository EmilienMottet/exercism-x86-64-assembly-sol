fn title_case(input: String) -> String {
    let mut chars = input.chars();
    match chars.next() {
        None => String::new(),
        Some(f) => f.to_uppercase().collect::<String>() + chars.as_str(),
    }
}

fn bottle_format(n: u32) -> String {
    match n {
        0 => "no more".to_string(),
        n => n.to_string(),
    }
}

fn plurial(n: u32) -> String {
    match n {
        1 => "".to_string(),
        _ => "s".to_string(),
    }
}

fn take_bottle(n: u32) -> String {
    match n {
        1 => "it".to_string(),
        _ => "one".to_string(),
    }
}

fn action(n: u32) -> String {
    match n {
        0 => "Go to the store and buy some more".to_string(),
        _ => format!("Take {} down and pass it around", take_bottle(n)),
    }
}

pub fn verse(n: u32) -> String {
    let next_bottle = (99 + n) % 100;
    format!("{} bottle{} of beer on the wall, {} bottle{} of beer.\n{}, {} bottle{} of beer on the wall.\n",title_case( bottle_format(n) ), plurial(n), bottle_format(n), plurial(n), action(n) ,bottle_format(next_bottle) , plurial(next_bottle))
}

pub fn sing(start: u32, end: u32) -> String {
    (end..(start + 1))
        .rev()
        .map(|n| verse(n))
        .collect::<Vec<String>>()
        .join("\n")
}
