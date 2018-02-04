fn get_i32() -> i32 {
    let mut buffer = String::new();
    std::io::stdin().read_line(&mut buffer).expect("Failed");
    buffer.trim().parse::<i32>().unwrap()
}

fn get_f32() -> f32 {
    let mut buffer = String::new();
    std::io::stdin().read_line(&mut buffer).expect("Failed");
    buffer.trim().parse::<f32>().unwrap()
}
fn main() {
    let mealCost :f32 = get_f32() ;
    let tipPercent :i32= get_i32() ;
    let taxPercent :i32= get_i32() ;
    let tip = tipPercent as f32 * 0.01 * mealCost;
    let tax = taxPercent as f32 * 0.01 * mealCost;
    let totalCost = (tip + tax + mealCost).round();
    println!("The total meal cost is {} dollars.",totalCost)
}
