// var is a constant
var a:Int = 1
// let is a variable
let b:Int = 3

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
