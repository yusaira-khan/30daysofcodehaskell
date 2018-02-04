// Enter your code here 
fn get_i32() -> i32 {
    let mut buffer = String::new();
    std::io::stdin().read_line(&mut buffer).expect("Failed");
    buffer.trim().parse::<i32>().unwrap()
}

fn main() {
    let num :i32= get_i32() ;
    for i in 1..11{
        println!( "{} x {} = {}", num, i, num * i)
    }
}
