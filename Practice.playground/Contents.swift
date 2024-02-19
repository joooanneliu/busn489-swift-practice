// var is a constant
var a_const:Int = 1
// let is a variable
let b_var:Int = 3

var defaultColor:String = "red [DEFAULT]"
var color: String? // defaults to nil with the ?


// Nil-Coalescing Operator
// a ?? b same as a != nil ? a! : b
var colorName = color ?? defaultColor // sets to defaultColor since color is null
color = "blue"
print(colorName)
var colorName2 = color ?? defaultColor
print(colorName2)

// closed range
for index in (1...5) {
    print("\(index) times 5 is \(index * 5)")
}

// half open range (usual for-loops starting from 0 to n open range)
for i in 0..<3 {
    print("second for loop: \(i)")
}

// note: single quotes in swift don't exist for char
let letters:Array = ["a", "b", "c", "d"]
// one-sided ranges
for i in letters[0...3] {
    print("third for loop: \(i)")
}
print()
for i in letters[...2] {
    print("array for loop: \(i)")
}

// same as above (half-open as a one-sided range)
for i in letters[..<3] {
    print("array for loop 2: \(i)")
}
for i in letters[1...] {
    print(i)
}

print()
// fuction returning multiple values, array is argument label!
func minMax(array: [Int])-> (min: Int, max: Int) {
    var currMin = array[0]
    var currMax = array[0]
    
    for i in array[1...] {
        if i < currMin {
            currMin = i
        } else if i > currMax {
            currMax = i
        }
    }
    return (currMin, currMax)
}

let arr:[Int] = [0, -100, 4, 9, 2, 10]
print(minMax(array: arr))

func numModulo(dividend a:Int, divisor b:Int)-> Int {
    return a % b
}

print(numModulo(dividend: 5, divisor:3))

// a '+' in print does NOT add space
print("hello" + "world")
// a comma in print adds space
print("howdy", "world!")

// double = int multiplied by double is still exact
var product:Double = 5 * 1.5
var product2:Double = 5.0 * 1.5

// int = double * int gives error
// var product3:Int = 5 * 1.5

// gives basic math functions i.e. sqrt and pow
import Foundation
var a:Int = 3
var b:Int = 2
var c:Double = 3
var d:Double = 1/2

var e:Double = 3/2
// var f:Double = a/b ERROR, can't convert result to double
var f:Int = a/b

// pow has double as parameters

// does not work because a and b are ints
// var power1:Double = pow(a, b)
// doesn't work because pow returns a double
// var power2:Int = pow(c,d)
// Int(...) = floor rounding
var power2:Int = Int(pow(c, d))
var power3:Double = pow(c, d)

print(power2, power3)
