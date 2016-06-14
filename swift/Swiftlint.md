# SwiftLint Rules

The rules are simple which is:

* Always end the file with a blank line at the end.

* There must always be an empty blank space between each identifier, keyword and symbols.

* Each conditional statements, loops (`if`,`guard`,`else`,`for`,`while`,`switch`, like so) and classes, structures, enums, protocols should have it's code inside `{ }` which should have `{` in the same line of definition, and `}` in the ending line.

* A colon`:` and a comma`,` should always start right after any identifier, keyword without any blank space, but should always have a blank space following it. Which is `let a: Int?`,`func example(parameterOne: String, parameterTwo: String)`.

* Usage of legacy constructors should be avoided. Such as `CGRectMake()`,`CGPointMake()`, etc should be replaced by `CGRect()`,`CGPoint()` like so. The reason is explained in detail in [this blog](https://medium.com/swift-programming/swift-cgrect-cgsize-cgpoint-5f4196da9cf8#.qtkqglwnb).

* Statement position of `else` and `catch`, should be on the same line as that of previous declaration of the `if` and `try`, as in:

```swift
if condition {
  // Do something
}               // Will show a warning saying that "Statement position violation"
else {
  // Do something
}
```

* Each opening brace should be preceded by a single space before its declaration, as in

```swift
func example(){ // This will show a warning "Opening brace spacing violation"
  //Do something
}
```

* The most committed error that pops a warning is the "Trailing whitespace violation", which is any line in the code should not have a trailing white space.

* These are few of the SwiftLint rules, so to checkout every rule that's present [click here](https://github.com/realm/SwiftLint/tree/master/Source/SwiftLintFramework/Rules). The rules are in .swift files, and you can go through every rule for it's implementation and to see what warning message it pops when it encounters this error.  

* The SwiftLint rules with examples can be [found here](https://swifting.io/blog/2016/03/29/11-swiftlint/).
