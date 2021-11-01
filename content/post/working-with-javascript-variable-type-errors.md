---
title: "Working With JavaScript Variable Type Errors"
description: Variable type errors in JavaScript.
date: 2020-04-28T14:31:08+10:00
draft: false
categories:
    - "Programming"
tags:
    - "JavaScript"
---

I was struggling to get some code working in JavaScript and realised that I'd made a small variable type error. This is one of the problems in working with a loosely typed language like JavaScript.

When I work in C# it is strongly typed meaning that I have to declare a variable and its type at the same time. This saves a multitude of errors in my code. Unfortunately I don't have this luxury with JavaScript and I have to be more careful with my variables.

##### My original code

{{< highlight javascript "linenos=inline,linenostart=1" >}}
    // get array from location.hash
    const hashArray  = function (hash) {
      const arrayValues = hash.split("-");
      return arrayValues;
    }

    const artists = getSavedArtists();

    const arr = hashArray(location.hash);

    let artistId = arr[0];
    artistId = artistId.slice(1);
    const RecordId = arr[1];

    // Find an artist
    const findArtist = function (artists, artistId) {
      return artists.find(function (item) {
        return item.artist[0].artistid === artistId;
      });
    }
{{< / highlight >}}

I take the ``location.hash`` value from my URL, for example, **#582-432**. I split this into an array using the **-** as a separator and the first number is the *artistId* and the last number is the *recordId*. I also need to ``slice()`` the first character off *artistId* which is the hash character.

My big mistake was that I forgot that ``split()`` only returns strings. As a result the ``findArtist()`` function wasn't returning the **artist** object.

I always use the strict equality comparison operator to do my checking.

{{< highlight javascript >}}
    item.artist[0].artistid === artistId;
{{< / highlight >}}

*item.artist[0].artistid* was a number and *artistId* was a string so the strict equality comparison wasn't finding a match.

I changed the equation to the type converting equality comparison.

{{< highlight javascript >}}
    item.artist[0].artistid == artistId;
{{< / highlight >}}

And this allowed me to find a match. It converts both variables to the same type for the comparison. This is something that is only found in JavaScript and takes a while to get used to.

Most JavaScript coders would be comfortable that the code was producing a result and leave the type conversion equality operator in place.

Coming from a strongly typed language background I find this code strange and so I decided to do the job properly and make sure the variables I created had the correct type.

{{< highlight javascript "linenos=inline,linenostart=11" >}}
    let aid = arr[0];
    aid = aid.slice(1);
    const rid = arr[1];
    const artistId = parseInt(aid);
    const recordId = parseInt(rid);

    // Find an artist
    const findArtist = function (artists, artistId) {
        return artists.find(function (item) {
            return item.artist[0].artistid === artistId;
        });
    }
{{< / highlight >}}

I use the ``parseInt()`` function to convert my *artistId* and *recordId* variables into numbers. Now I can use the strict equality operator to do an exact match.

The other thing that I could have done to check my variable's type is to use the ``typeof()`` operator to check type.

{{< highlight javascript >}}
    console.log(typeof(artistId));
    console.log(typeof(recordId));
{{< / highlight >}}

This would tell me that both of my variables were numbers. I will make sure that I use ``typeof()`` more often when I'm coding.
