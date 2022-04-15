use bencher::black_box;

const LIMIT: i64 = 10000000;

fn main() {
    let mut i = LIMIT;

    while i > 0 {
        // prevent loop-optimization
        i = black_box(i - 1);
    }

    black_box(i);
}
