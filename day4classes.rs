struct Person {
    age: i32
}
impl Person {
    fn new(initialAge: i32) -> Person {
        // Add some more code to run some checks on initialAge
        let initialAge = if initialAge <0 {println!("Age is not valid, setting age to 0.");0}else{initialAge};
        Person { age: initialAge }
        
    }
 
    fn amIOld(&self) {
        // Do some computations in here and print out the correct statement to the console
        match self.age{
            a if a < 13 => println!("You are young."),
            a if a < 18 => println!("You are a teenager."),
            _ => println!("You are old."),
        }
    }
 
    fn yearPasses(&mut self) {
        // Increment the age of the person in here
        self.age+=1
    }
}

fn main() {
    let T: i32 = read_line().trim().parse().unwrap();
 
    for _ in 0..T {
        let age = read_line().trim().parse().unwrap();
        let mut p = Person::new(age);
 
        p.amIOld();
 
        for _ in 0..3 {
            p.yearPasses();
        }
 
        p.amIOld();
        println!("");
    }
}

 fn read_line() -> String {
   let mut  input = String::new();
   std::io::stdin().read_line(&mut input).expect("Could not read stdin!");
    return input;
    

}
