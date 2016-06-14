/*:
 # Swift
This playground has every code snippet that is present in the [Swift documentation file](SWIFT-readme.md).
The comments can be given in the form of // or starting with /\* and ending with *\/.
The comments can have a workability feature where you can use it for marking section of your code ( MARK:), as in to keep similar methods in one section or to mark a section which is to yet to be completed and thing to be doing in there( TODO:).
To mark sections we can have:
*/
import Foundation
// MARK: Example 1
func toPrintExample1() {
    print("This is example 1")
}
// MARK: Example 2
func toPrintExample2() {
    print("This is example 2")
}
/*:
 **Strings:**  
 The Strings in Swift can be merged with non String values to make a single String value. This is called as String interpolation, where in you can give values with a `\`(backslash) to type cast the data to String.
 */
 let numOfStates = 50
 let country = "USA"
 let interpolatedString = "The number of states in \(country) is \(numOfStates)."
 print(interpolatedString)
//: **Value types and Reference types:**
//: *Value type example 1:*
struct Example1 {
    var data: Int = -1
}
var a = Example1()
var b = a						// a is copied to b.
a.data = 22				  // Changes a, not b.
print("\(a.data), \(b.data)")	// prints "22, -1"  
//:*Value type example 2:*
struct Dog {
    var wasFed = false
}
let labrador = Dog()
let puppy = labrador
//labrador.wasFed = true // Cannot do this! Uncomment to see the error!
//puppy.wasFed = true // Cannot do this! Uncomment to see the error!  
//: *Reference type example:*
class Example2 {
    var data: Int = -1
}
var x = Example2()
var y = x						// x is copied to y.
x.data = 22					// changes the instance referred to by x and y.
print("\(x.data), \(y.data)")	// prints "22, 22".  
//: *Reference type example 2:*  
class Car {
    var wasWashed = false
}
let mercedes = Car()
let s350 = mercedes
s350.wasWashed = true
if mercedes.wasWashed {
    print("Mercedes cars were washed")
} else {
    print("Just the S350 was washed")
}
// prints Mercedes cars were washed  
/*: 
 **Pattern Matching:**  
 Swift provides extensive pattern matching for comparing, type casting, and many such purposes. Patterns are just structures, which consist of values which can be matched with other values. 
 */
func isEven(number: Int) -> Bool {
    return number % 2 == 0
}
if isEven(2) {  // Try with other numbers and find the result
    print("The number is an even number")
    // Do something
} else {
    print("The number is an odd number")
    // Do something
}
//: In the `isEven()` above, the rule which is the pattern is that `number % 2` and value is `0` and it is checking if it is equatable. The function having a return type of `Bool`, will return `true` or `false`, based on the pattern matching result. This is taken to the overloaded operator function of `~=` for equatable types. Similarly, we can have the pattern matching for the `for` loop with a pattern `_` which matches any value.  
for _ in 0...3 {
    //We can use this for doing something in a loop for n times, without the value of the iteration being considered
    print("Say this 4 times")
    //Try changing ... to ..< in above condition to see what happens, accordingly change the print statement.
}
//: **Tuple values**:
//: The example below demonstrates how to use regular expressions for pattern matching in Swift. The regular expression can be given for matching in a `if` condition in Swift, where in the regular expression is compared with self object and upon matching will return a true Bool value for the `if` condition.   
//: Also from the example, you will get an idea on how to give the documentation for a property/method in a project. Any programmer who would go through your code should be able to understand each and every method and property's working before they can use them. Therefore, it is helpful if you could provide documentaion for not so obvious methods whose working are hard to understand at one go.  
//: The documentation can be given by specifying it in between /** and */, so that it will be shown as a quick documentation when a programmer option clicks the parameter/method for more information.
class TupleExample {
    var count = 1
    enum iterationNumber: Character {
        case first = "1"  // for extension st
        case second = "2" // for extension nd
        case third = "3"  // for extension rd
    }
    //The below format gives the quick documentation for the method getTuple().
    /**
     This method creates _n_ number of the tuples of consequtive numbers in form of (i,j) where *j = i+1* and _n_ = **howManyTuples**
     
     - parameter howManyTuples: A parameter specifying the total number of tuples needed.
     
     - returns: An array consisting of **howManyTuples** number of tuples.
     */
    func getTuples(howManyTuples howManyTuples: Int) -> [(Int, Int)] {
        var i = 1, j = 2, tuples: [(Int,Int)] = []
        for _ in 1...howManyTuples {
            tuples.append((i,j))
            i += 2
            j += 2
        }
        return tuples
    }
    // Call this method to find the working of the code.
    func doThisFirst() {
        //Option click on the getTuple() to see the quick documentation.
        let tuples = getTuples(howManyTuples: 10)
        for (x, y) in tuples {
            let countLastCharacter = String(count).characters.last!
            let characterCount = String(count).characters.count
            //The pattern .1. matches xx..x1xx..x such as 514,1213,2123,4533144 like so.
            if doesMatchPattern(pattern: ".1.", count: count) {
                // For count between 100 and 1000.
                if characterCount == 3 {
                    printValue(x: x, y: y, withExtension: "th")
                } // For count above 1000, and matching only which has the pattern xx1x such as 1213,3412,1111 like so.
                else if characterCount > 3 && doesMatchPattern(pattern: "..1.", count: count) {
                    printValue(x: x, y: y, withExtension: "th")
                } // For every other count value in the range above 1000 and not in pattern xx1x.
                else {
                    evaluateAndPrint(x: x, y: y, countLastCharacter: countLastCharacter)
                }
            } else {
                if characterCount < 3 && doesMatchPattern(pattern: "1.", count: count) {
                    printValue(x: x, y: y, withExtension: "th")
                } else {
                    evaluateAndPrint(x: x, y: y, countLastCharacter: countLastCharacter)
                }
            }
            count += 1
        }
    }
    func doesMatchPattern(pattern pattern: String, count: Int) -> Bool {
        //Evaluates if given count matches with the pattern.
        return String(count).rangeOfString(pattern, options: .RegularExpressionSearch) != nil
    }
    func evaluateAndPrint(x x: Int, y: Int, countLastCharacter: Character) {
        switch countLastCharacter {
        case iterationNumber.first.rawValue:
            printValue(x: x, y: y, withExtension: "st")
        case iterationNumber.second.rawValue:
            printValue(x: x, y: y, withExtension: "nd")
        case iterationNumber.third.rawValue:
            printValue(x: x, y: y, withExtension: "rd")
        default:  //Any number ending with number other than 1,2,3 and not between 11 to 19 inclusive.
            printValue(x: x, y: y, withExtension: "th")
        }

    }
    func printValue(x x: Int, y: Int, withExtension: String ) {
            print("This is the value of (x,y):(\(x),\(y)) for \(count)\(withExtension) iteration")
    }
}
let callTuple = TupleExample()
callTuple.doThisFirst()