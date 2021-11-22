
struct Data<T> {
    value: T,

}

fn main(){

    let mut t:Data<i32> = Data{ value: 400 };

    let mut f: Data<String> = Data{ value: "Champ".to_string() };
    
    println!("t = {}", t.value);
    
    println!("f = {}", f.value);
    
    let mut c: Data<f32> = Data{ value: 5.52 };
    let mut d: Data<f32> = Data{ value: 4.67 };
    println!("5.52 + 4.67 = {}", add(c.value, d.value));


}


fn add<T>(a: T, b: T) -> T {

    a + 2
}

fn sub<T>(a: T) -> T {

    a - 2
}
