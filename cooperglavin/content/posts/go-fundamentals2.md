+++
title = "Go Fundamentals: Intro"
date = "2023-04-19T23:30:12-04:00"
author = ""
authorTwitter = "" #do not include @
cover = ""
tags = ["", ""]
keywords = ["", ""]
description = ""
showFullContent = false
readingTime = false
hideComments = false
color = "" #color from the theme settings
+++
While these will be published out of order, this is the intro to Go fundamentals article, covering what Go (or Golang) is, why you should use it, as well as some key concepts to know. While my other articles on Go fundamentals about (channels)[https://cglavin50.github.io/posts/channels/] and (marshalling)[https://cglavin50.github.io/posts/go-fundamentals/] will be more specific, this article will cover a broad base around Go.

# What is Go?

Go, or Golang, is Google's programming language that was developed in 2007 to improve productivity in multicore networking machines. At it's core, Go does exactly that - provide excellent support for concurreny and networking functionality, all while being lightweight with blazing fast compile times. Go is a strongly statically typed compiled langauge, residing mostly in the C family, and comes with an extensive built-in library (called the runtime). Go does not use a VM like Java, and instead Go's compiler will directly generate binary code like C/C++. Go also has a unique scheme of packages, modules, and workspaces that removes much overhead of C-style includes (although has a bit of a learning curve to pick up).

# How to format Go code

**Go packages** are a way to bundle code with a single goal. A package is a directory of .go files, which allows you to organize your code into reusable units, and import other useful packages (from runtime or github) easily. Go has no private, protected, public scheme, so instead global variables within a .go file will have package scope (meaning all files with the same package header can access them). Additionally, Go supports exported and unexported values (having the first letter of a function or variable means it will be exported), where exported values will be visable outside the package as well. Go consideres each directory its own package, and these serve as the building blocks for any Go program.

**Go modules** are a collection of Go packages, all linked with a "go.mod" file. Typically each project should have one module, and each module specifies the path to all packages used. Go provides a simple interface for using packages, with `$ go install github.com/example` installing and appending directives to the go.mod file to use it. The call `$ go get github.com/example` will only add, update, or remove dependencies from the go.mod file, not long building/installing (this is a newer change from Go 1.18). After installing external packages, we can use them with `import ("github.com/example")`.

In the case you need to work across multiple modules at the same time, **Go workspaces** are the way to go. In the root of your project where both modules reside, you can use a go.work file to specify the location of each module, allowing us to refer to packages across the modules.

# Typing in Go

Go is very explicit about typing. There is no automatic conversion (or promotion), so to do something like 
``` 
i := 20 // int
f := 20.2 // float64
sum := i + int(j) // j will be converted to an int, otherwise the compiler will throw an error
```

Go supports a variety of data types, with unsigned ints being denoted as uint, and allowing the user to specify the size of the integer, as either 8, 16, 32, or 64 bits (ex uint32 refers to a 32-bit unsigned int). There are strings, booleans (bool), and numeric data types. Go has no support for the char data type, instead using the byte (uint8) or rune (int32) to refer to an ASCII character or UTF-8 unicode character respectively. Finally, Go supports (but does not require) static type declaration with the syntax `var x int`, as the compiler knows x's type and can perform linking and run-time, but typically users will perform declaration and instantiation with the " := " operator, ex `x := 10 (note: the := operator can only be used when you are creating a new variable). 

The above mentioned (strings, numerics, booleans) are all primitive types, meaning Go will store them as read-only data, so actions like string concatenation will make a new string. Just like Java, the best way to get around this is with the strings.Builder data type, and call the .WriteString method to avoid memory copying.

# Parameters in Go

Go is a pass-by-value language, so to get around this functions can take in pointers to data, such as `func myFunc(temp *string) { temp = "new string" }`, and passing in a reference via the `&` operator. Pointers and dereferencing function the same in Go as they do in the C-family, so C/C++ programmers should feel right at home.

# Slices in Go

As an honorable mention, Go slices are a dynamically sized way to view elements of an array that are frequently used. With the syntax `arrayName[low : high]`, the slice will give you a way to access the values of the array, from the low index (inclusive), to the high index (exclusive).