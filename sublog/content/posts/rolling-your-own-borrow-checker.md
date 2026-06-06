+++
date = '2026-06-04T09:25:15+10:00'
draft = true
title = 'Rolling Your Own Borrow Checker'
+++

# Introduction

Orignally, I was going to look into why (and how) rust is able to maintain speed with a
borrow checker - to which I was informed by my rust lecturer on how the borrow checker is
ran at compile time, and not runtime! That meant I would need to pivot my idea... But what
would I do?

## Lets write our own borrow checker - how hard can it be?

Keep in mind that this blog is being written as I work on the borrow checker! I **WILL**
make mistakes and you will get to see them in real time! 

### Understanding the borrow checker

Before we actually start writing our own borrow checker, we should first figure out what
the borrow checker already does!  
There are three(?) ways of managing memory in programs so far[1]:
- manual memory management where the programmer has to allocate and free memory manually
  (think `malloc()` and `free()`). This however leads to mistakes which I'm sure every
  programmer has experienced before - use after free bugs, memory leaks, etc!
- garbage collectors see this, and decide handle memory management for the programmer. It
  finds data that is no longer referenced by a variable: 
  ```
  a = malloc();
  a = NULL;
  ```
  (we can see in this case that the data from `malloc()` is no longer bound to `a`, and
  thus would be a memory leak! The garbage collector sees this, and cleans it up for us).

# References
[1] https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html
[2] https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)
