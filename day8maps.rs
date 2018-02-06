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
use std::collections::HashMap;

fn main() {
    let _n = get_i32();
    let mut phone_book :HashMap<String, String>= HashMap::new();
    (0.._n).all(
        |_i:i32|->bool{
            let l=get_str();
            let mut temp  = l.trim().split(' ');
            let k = String::from(temp.next().unwrap());
            let v = String::from(temp.next().unwrap());
            phone_book.insert(k,v);
            // println!("hey {} = {}",k,v);
            true});
    loop{
        let k :String= String::from(get_str().trim());
        if k.is_empty() {break;}
        match phone_book.get(&k) {
            Some(v) => println!("{}={}", k, v),
            None => println!("Not found")
        }
        
    }
}
