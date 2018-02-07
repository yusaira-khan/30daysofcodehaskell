fn get_i32() -> i32 {
    let mut buffer = String::new();
    std::io::stdin().read_line(&mut buffer).expect("Failed");
    buffer.trim().parse::<i32>().unwrap()
}

fn main() {
    let _n = get_i32();
    println!("{}",(
    (2..(_n+1)).fold(1,|i,acc|i*acc)))
}
