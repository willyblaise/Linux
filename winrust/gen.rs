use std::ops::Mul;


fn square<T: Mul<Output = T> + Copy> (x: T) -> T {
    return x * x;

}


fn main(){

    let res = square(10);

    println!("res = {:?}", res);
}
