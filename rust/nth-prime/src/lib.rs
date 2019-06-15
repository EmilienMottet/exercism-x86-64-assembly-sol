fn is_prime(n: u32) -> bool {
    for i in 2..(n - 1) {
        if n % i == 0 {
            return false;
        }
    }
    true
}

pub fn nth(n: u32) -> u32 {
    let mut i = 2;
    let mut ct = 0;
    while ct < n {
        i += 1;
        if is_prime(i) {
            ct += 1;
        }
    }
    return i;
}
