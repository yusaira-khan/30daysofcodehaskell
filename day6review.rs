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
    let n = get_i32();
    for _i in 0..n{
        let  b0 = get_str();
        let buf = b0.trim();
        let (b2,b1) : (Vec<(usize,char)>,Vec<(usize,char)>) = 
            buf.chars().enumerate()
              .partition(|&x:&(usize,char)|x.0%2==1 );
        let (_n1, c1):(Vec<usize>,Vec<char>) = b1.into_iter().unzip();
        let (_n2, c2):(Vec<usize>,Vec<char>) = b2.into_iter().unzip();
        let s1 : String = c1.into_iter().collect();
        let s2 : String = c2.into_iter().collect();
        
        println!("{} {}",s1,s2);
    }
}
