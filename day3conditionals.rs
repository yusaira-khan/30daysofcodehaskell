enum NumWeird {
    Weird,
    NotWeird
}

impl std::fmt::Display for NumWeird {
    // This trait requires `fmt` with this exact signature.
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match *self{
            NumWeird::NotWeird => write!(f, "Not Weird"),
            _=> write!(f, "Weird")
        }
    }
}

fn get_i32() -> i32 {
    let mut buffer = String::new();
    std::io::stdin().read_line(&mut buffer).expect("Failed");
    buffer.trim().parse::<i32>().unwrap()
}

fn is_weird(x:i32)->NumWeird{
    match x {
        x if x % 2 == 1 => NumWeird::Weird,
        2...5 => NumWeird::NotWeird,
        6...20 => NumWeird::Weird,
        _ => NumWeird::NotWeird
    }
}


fn main() {
   // let num :i32= get_i32() ;÷
    println!( "{}",is_weird(get_i32()))
}
