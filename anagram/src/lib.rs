use std::collections::HashSet;
use std::iter::FromIterator;
use std::iter::Iterator;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let word_lower = word.to_lowercase();
    let sorted_word = compute_str(&word_lower);
    let filtered = possible_anagrams.into_iter().filter(|&&w| {
        let w_lower = &w.to_lowercase();
        return compute_str(&w_lower).eq(&sorted_word)
            && !word_lower.eq(w_lower);
    });
    filtered.cloned().collect()
}

fn compute_str(word: &str) -> String {
    let mut sorted: Vec<char> = word.chars().collect();
    sorted.sort_unstable();
    String::from_iter(sorted)
}
