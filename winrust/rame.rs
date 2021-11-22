


use std::io::stdin;


fn main(){

    println!("Enter your name: ");

    let mut name = String::new();
    stdin().read_line(&mut name);

    print!("My name is {}.", name);
}
