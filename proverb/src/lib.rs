pub fn build_proverb(list: &[&str]) -> String {
    if list.is_empty() {
        return String::new();
    }
    let begin = list
        .windows(2)
        .map(|arr| return format!("For want of a {} the {} was lost.", arr[0], arr[1]))
        .fold(String::new(), |a, b| format!("{}{}\n", a, b));
    return format!("{}And all for the want of a {}.", begin, list[0]);
}
