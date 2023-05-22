+++
title = "JavaScript Promises Explained"
date = "2023-05-22T12:20:43-07:00"
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

# Promises 101

Promises are the building blocks for asynchronous functions in JS. Promise objects are returned by an async function, and can be handled accordingly, eventually returning either a value upon completion, or an error. They are a clean way to deal with asynchronous functions, and provide an easy way to work with the result of an asynchronous function within a larger setting.

Promises have three states:
- Pending: the initial state of a promise, maintained while the async code is executing
- Resolved: a completed promise
- Rejected: a failed promise

When a promise is moves from pending to resolved or rejected, it goes from being a *pending* promise to a *settled* promise.

# Callbacks vs Promise Handling (.then())

Callback functions are passed as arguments to an async function, which will then execute after the async operation is finished. For example:
```
asyncFunction(function(result) {
    console.log('asyncFunction has returned with value: ' + result)
})
```
However, this can lead to *Callback Hell*, where chaining multiple callback functions gets messy:
```
asyncFunction(function(result) {
    asyncFunction2(result, function(nextResult) {
        asyncFunction3(nextResult, function(thirdResult) {
            console.log('This is the result of the three async operations dependent on each other')
        }, failureCallbackFunction)
    }, failureCallbackFunction)
}, failureCallbackFunction)
```
Instead, you can use the *Promise Handler* to handle each settled case. `promise.then((data) => { code here... })` allows you to handle resolved promises, and can be chained together, and paired with a `.catch((error) => { console.log(error)}).` to handle the rejected case (note: `.then()` functions return a promise, so you can easily chain multiple together to get sequential asynchronous handling, appended with a `.catch()` to handle any outgoing errors). Translating the callback hell from above:
```
asyncFunction().then((result) => {
    return asyncFunction2(result)
}).then((nextResult) => {
    return asyncFunction3(nextResult)
}).catch((error) => { console.log('Error in promise') });
```
An alternative syntax is as follows for handling a single promise:
```
promise.then(
    (result) => { // resolved case
        console.log({result})
    },
    (error) => { // rejected case
        console.log('Error in promise')
});
```

