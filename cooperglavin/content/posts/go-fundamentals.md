+++
title = "Go Fundamentals: Marshaling"
date = "2023-04-18T19:52:16-04:00"
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
As Go has increasingly become my go-to langauge for backend projects, I figured I should brush up on it's fundamentals, and what better way to make sure you learned something that to teach it? As such I'm planning to make my series of blog posts over the next week Go-related, continuing from my [Channels article](https://cglavin50.github.io/posts/channels/) last week. Today's topic: Marshalling

# What is Marshalling?

Marshalling is the process of transforming a memory representation of an object (typically a struct in Go), into data (ex converting an object into a JSON file). Luckily, Go has multiple APIs to work with JSON data, and today we will use the **encoding/json** package to show how to convert data into JSON format, and how to 'unmarshal' it, or parse and extract the JSON data into an object.

# Marshalling in Go

First things first, we need to import our encoding/json package.
```
package main

import (
    "encoding/json"
    "fmt"
)
```
Next, let's define a struct that we want to use, say a task for a [To-Do List Project](https://github.com/cglavin50/to-do.git).
```
type Task struct {
    ID          int
    TaskText    string
    Status      bool
}
```
Note that all members begin with an upper-case letter, as this indicates an exported identifier, and can be used outside the package. This applies to the struct name, Task, as well.
To marshal, all we need to do is create an instance of a task, and then use the **json.Marshal()** function, as seen below.
```
func main() {
    task := Task{ID: 1, TaskText: "marshal this task", Status: false}
    taskData, err := json.Marshal(task)
    if err != nil {
        fmt.Println("Error encoding the data", err)
    }
    fmt.Println(string(taskData))
}
```
The above program should print the Task in JSON format: `{"ID":1,"TaskText":"marshal this task","Status":false}`. Next, let's unmarshal this data with the use of Field Tags.

# Unmarshalling

We can add field tags, which correlate to the JSON interpretation of your data. We can include statements like "omitempty" to skip these values if they don't exist, and can even rename the variables if we want them to be lowercase, or any other use case when the variable name should be different than the JSON format. We can edit the Task struct with:
```
type Task struct {
    ID          int         `json:"ID,omitempty"
    TaskText    string      `json:"TaskText,omitempty"
    Status      bool        `json:"Status,omitempty"
}
```
Now, using this struct we can handle receieved JSON data (ex via a NoSQL DB like Mongo), with the **json.Unmarshal()** function.
```
func main() {
    taskJSON := `{"ID":1,"TaskText":"unmarshal this task","Status":false}`
    var task Task
    json.Unmarshal([]byte(taskJSON), &task)
    fmt.Printf("ID: %s, TaskText: %s, Status: %s", task.ID, task.TaskText, task.Status())
}
```
This should return `ID: 1, TaskText: unmarshal this text, Status: false`
Two final notes:
1. Go will make tolerate case-insensitive JSON properties. So if our JSON input looked like `{"id":1,"taskText":"unmarshal this task","status":false}`, it would still map accordingly.
2. json.unmarshal will also work with arrays, so if we had an array of objects in the JSON, like `[{"ID":1,"TaskText":"marshal this task","Status":false}, {"ID":1,"TaskText":"publish this blog post","Status":true}`, and `var tasks []Task`, `json.Unmarshal([]byte(taskJSON), &tasks)` would populate that array of Task objects accordingly.