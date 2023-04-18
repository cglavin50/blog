+++
title = "Channels"
date = "2023-04-18T00:02:09-04:00"
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

# Intro to Channels in Go

As I got a day to work on some Golang projects, I wanted to cover channels in Go. First of all, what are Golang channels and what make them so great? Go is a language known for it's concurrency support, and channels provide an easy way for concurrent goroutines to communicate/send data. Say I have some basic function here:
```
package main

import (
    "fmt"
    "time"
)

func main() {
    results := make(chan int) // created with the make keyword, we are creating a channel to receive integers over
    go func() {
        // so some calculations here
        time.Sleep(10 * time.Second)
        results <- computationalResult
    }()

    // perform some concurrent computations here
    localResult := 5
    total := <- results
    total += localResult

    fmt.Println(total)
}
```
In this example, we can send off a goroutine to perform some more computationally heavy work, while continuing the flow in our main function. Then, we can wait until the channel receives a value to compute it to our local total, and finish everything. With easy to use syntax, channels allow us to easily send off multiple goroutines, then compile results and/or wait for specific values or signals to proceed through the flow of our code.

By default, channels are unbuffered in Go. In other words, for each send `channel <- "msg1"`, there must be a corresponding receive `msgs <- channel`. We can create a buffered channel, that allows us to accept a passed-in amount of values before a corresponding receive, ex `results := make(chan int, 4)`, where four ints can be sent over the results channel before a receive must be called.

Finally, we can use `select{}` to synchronize across multiple channels. Like a switch we define multiple cases, and then when a case can be ran, it will execute. If there are multiple available simultaneously, the switch will choose one at random. One example here: 
``` 
select {
    case msgs <- msgsChannel:
        fmt.Println(msgs)
    case <- quitChannel:
        fmt.Println("quit message receieved")
        return
} 
```
Note: we can also wrap this in an infinte for loop to keep receiving messages until a quit is received, which will then finally exit the program.