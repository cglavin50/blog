+++
title = "FirebaseKey"
date = "2023-05-01T23:56:03-04:00"
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
# Is It Safe To Publish Your Firebase API Key?
TLDR: Yes.
As a frequent user of Firebase for user authentication, databases, and web-app deployment, I recently ran into the issue of where to put my Firebase API key. When you create a new app with Firebase, you get an API login like this:
```
const firebaseConfig = {
  apiKey: "AIzaSyCCnMZtY_oH07FsUzzAh4zeQN4GiR4W3dQ",
  authDomain: "job-crawler-d3002.firebaseapp.com",
  projectId: "job-crawler-d3002",
  storageBucket: "job-crawler-d3002.appspot.com",
  messagingSenderId: "298085583690",
  appId: "1:298085583690:web:32133c39677dbc8d4ccfb3",
  measurementId: "G-XXMHYVE729"
};
```
Typically posting something like this can be scary, and proper key management can get complex with larger projects. Git will throw some warnings, and GCP will also throw a notice when ever a Google API Key is publicly accessible. However, these are just warnings that come with any key, and this is a public key that is safe to publish. Accordingly to a [GCP employee](https://stackoverflow.com/questions/37482366/is-it-safe-to-expose-firebase-apikey-to-the-public/37484053#37484053), this data only identifies your project to the Google servers, and is not a security risk. Additionally, combined with some security rules implemented in your project (managing who can access data/when) and [Firebase App Check](https://firebase.google.com/docs/app-check) to create API call rules with associated providers, your project will be safe from all potential abuse. 

# Extra Links for Key Management
While I plan to write a more in-depth post on key-management as it has been a recurring issue for me as of late, I've found [this](https://www.freecodecamp.org/news/how-to-securely-store-api-keys-4ff3ea19ebda) article to be really helpful on tips for storing keys, as well as this [article on how to remove sensitive data from Git repos](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository).