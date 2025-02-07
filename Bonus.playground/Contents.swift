import UIKit

func arrayInt (_ array: [Int], b1: (Int) -> Int) -> [Int]{
    return array.map(b1)
}
func arrayString (_ array: [Int], b1: (Int) -> String) -> [String]{
    return array.map(b1)
}

let numbers = [1,2,3,4,5]

let doubled = arrayInt(numbers) { array in
    numbers * 2
}
print(doubled)

let string = arrayString(<#T##array: [Int]##[Int]#>, b1: <#T##(Int) -> String#>)
print(string)

let square = arrayInt(<#T##array: [Int]##[Int]#>, b1: <#T##(Int) -> Int#>)
