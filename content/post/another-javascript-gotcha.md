---
title: "Another JavaScript Gotcha"
date: 2022-11-01T21:46:10+11:00
draft: false
categories:
  - "Programming"
tags:
  - "JavaScript"
  - "TypeScript"
---

I was working with TypeScript today and I ran into a JavaScript problem that caused me some issues.

I needed to fix the number of decimal places in a temperature calculation example.

This is my original TypeScript code.

```typescript
    let printOutput = (fahrenheit: number, celsius: number) => {
        console.log(`${fahrenheit} f = ${celsius} c.`);
    };

    let convert = (fahrenheit: number) => {
        let celsius = ((fahrenheit - 32) * (5 / 9));
        return celsius;
    };

    let fahrenheit = 100;
    let celsius = convert(fahrenheit);
    printOutput(fahrenheit, celsius);
```

Returns.

> 100 f = 37.77777777777778 c.

This works as expected but I wanted to limit the ``celsius`` value to two decimal places using ``.toFixed(2)``. I thought this would be a simple way to return a result.

```typescript
    let printOutput = (fahrenheit: number, celsius: number) => {
        console.log(`${fahrenheit} f = ${celsius} c.`);
    };

    let convert = (fahrenheit: number) => {
        let celsius = ((fahrenheit - 32) * (5 / 9));
        return celsius.toFixed(2);
    };

    let fahrenheit = 100;
    let celsius = convert(fahrenheit);
    printOutput(fahrenheit, celsius);
```

I got a TypeScript error on the last line of code for the ``celsius`` variable.

![TypeScript error.](/images/type-error.jpg "TypeScript error.")

I went to the Mozilla Developer Network website to read about ``toFixed()`` and found that while it worked on a **number** variable it returned a **string** value. This is another of those JavaScript gotchas that will catch an unwary developer.

If I was writing this code in JavaScript I probably wouldn't notice that the ``celsius`` variable's type had changed but as I am working in TypeScript it catches this type change.

There are a couple of ways that I can get around this problem.

```typescript
    let printOutput = (fahrenheit: number, celsius: string) => {
        console.log(`${fahrenheit} f = ${celsius} c.`);
    };

    let convert = (fahrenheit: number) => {
        let celsius = ((fahrenheit - 32) * (5 / 9));
        return celsius.toFixed(2);
    };

    let fahrenheit = 100;
    let celsius = convert(fahrenheit);
    printOutput(fahrenheit, celsius);
```

I change the ``celsius`` variable in the first line of code to a type of ``string``. This means that a variable type is changed by using the ``toFixed()`` method which is unacceptable to me.

Doing this defeats the reason I am working with TypeScript in the first place.

A better way of working is to do the following.

```typescript
    let printOutput = (fahrenheit: number, celsius: number) => {
        console.log(`${fahrenheit} f = ${celsius} c.`);
    };

    let convert = (fahrenheit: number) => {
        let celsius = ((fahrenheit - 32) * (5 / 9));
        const strCelsius = celsius.toFixed(2);
        return parseFloat(strCelsius);
    };

    let fahrenheit = 100;
    let celsius = convert(fahrenheit);
    printOutput(fahrenheit, celsius);
```

Returns.

> 100 f = 37.78 c.

This is the result I am expecting and the code doesn't change any variable types.

Once again, coming from a strongly type language background (``C#``) this wouldn't of happened but can be an issue with JavaScript. Fortunately working with TypeScript and compiling to JavaScript can stop this type of error.

This is the JavaScript that is returned from the TypeScript example.

```javascript
    "use strict";
    let printOutput = (fahrenheit, celsius) => {
        console.log(`${fahrenheit} f = ${celsius} c.`);
    };
    let convert = (fahrenheit) => {
        let celsius = ((fahrenheit - 32) * (5 / 9));
        const strCelsius = celsius.toFixed(2);
        return parseFloat(strCelsius);
    };
    fahrenheit = 100;
    celsius = convert(fahrenheit);
    printOutput(fahrenheit, celsius);
```
