fn get_i32() -> i32 {
    let mut buffer = String::new();
    std::io::stdin().read_line(&mut buffer).expect("Failed");
    buffer.trim().parse::<i32>().unwrap()
}
fn get_str()-> String   {
    let mut buffer = String::new();
    std::io::stdin().read_line(&mut buffer).expect("Failed");
    buffer
}

fn main() {
    let _n = get_i32();
    let nums :Vec<_>= get_str()
                .split_whitespace()
                .map(|s:&str|->i32{
                    s.parse::<i32>().unwrap()
                })
                .rev()
                .map(|s:i32|->String{
                    s.to_string()
                }).collect();

    for i in nums{
            print!("{} ",i);

    }
    println!("")
}
