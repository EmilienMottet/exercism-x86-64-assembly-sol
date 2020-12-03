use Comparison::{Equal, Sublist, Superlist, Unequal};

#[derive(Debug, PartialEq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

fn is_sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> bool {
    return match (first_list, second_list) {
        (a, b) if b.len() < a.len() => false,
        ([], _b) => true,
        (a, b) if a[0] == b[0] => is_ordered_sublist(&a[1..], &b[1..]) || is_sublist(a, &b[1..]),
        (a, b) => is_sublist(a, &b[1..]),
    };
}

fn is_ordered_sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> bool {
    return match (first_list, second_list) {
        (a, b) if b.len() < a.len() => false,
        ([], _b) => true,
        (a, b) if a[0] == b[0] => is_ordered_sublist(&a[1..], &b[1..]),
        (_a, _b) => false,
    };
}

pub fn sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> Comparison {
    return match (first_list, second_list) {
        (a, b) if a == b => Equal,
        (a, b) if is_sublist(a, b) => Sublist,
        (a, b) if is_sublist(b, a) => Superlist,
        _ => Unequal,
    };
}
