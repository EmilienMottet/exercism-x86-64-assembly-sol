fn is_prime(n: u32) -> bool {
    !(2..(n / 2 + 1)).any(|i| n % i == 0)
}

pub fn nth(n: u32) -> u32 {
    return (2..)
        .filter(|&n| is_prime(n as u32))
        .take((n + 1) as usize)
        .last()
        .unwrap();
}
