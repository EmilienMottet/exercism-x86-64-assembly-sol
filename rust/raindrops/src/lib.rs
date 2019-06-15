pub fn raindrops(n: u32) -> String {
    let rains: [(u32, String); 3] = [
        (3, "Pling".to_string()),
        (5, "Plang".to_string()),
        (7, "Plong".to_string()),
    ];
    let mut res = "".to_string();
    for (index, val) in rains.iter() {
        if n % index == 0 {
            res += val
        }
    }
    return if res == "" { n.to_string() } else { res };
}
