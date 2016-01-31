# Elm-tutorial
A introductory tutorial for working with elm - [Read the post](blog.chris-eich.com/tutorial-dom-manipulation-with-elm)

# #theNewHotness
I've been hearing about the awesomeness of elm for a little while now. It's a _strongly typed_ _functional language_ written for crafting user interfaces that compiles into javascript. It also has a _virtual-dom_ implementation that claims to be __faster than react__.

If you're keeping up with the hot buzzwords of the moment, we have:

* Functional Reactive Programming
* Virtual Dom
* Strongly Typed Javascript
* A new framework
* A new package manager

What's not to love. It's been a while since I've re-written all of my javascript. So let's get what we can hack together!!

# Our Test Project
To get started I'm replicating some code I hacked together a few afternoons ago for a client project. It's was such a simple task that I initially reached for jQuery. After a few refactorings, I was wishing I had just made some quick react components instead. It should provide a simple data driven example for testing our our budding elm skills.

# Project Goal
I have a list of __Insurance Carriers__ which each have an list of __Insurance Reps__ for each carrier. We want to be able to choose a _carrier_ and then a _rep_ belonging to that carrier.

# Initial Project Requirements

* __Create Two dropdowns:__ Insurance Carrier, Insurance Reps
* The First dropdown should display the `name` of the __Insurance Carrier__ and set the `value` to the carrier's `id`
* The second dropdown should update when the first is changed, using only __Rep__s belonging to the selected __Insurance Carrier__
* The __Insurance Rep__ dropdown should likewise show the __Insurance Rep__ `name` and set the value to the __Insurance Rep__'s `id`

# Getting Started
For this tutorial, all you'll need is an empty directory. You can also download the [git repo](https://github.com/cjeich/elm-tutorial) if you want to follow along. Each following post has it's own branch so you can start from same point I am as I write this.

Also, sure you have elm installed on your system. If you don't, you can [follow the instructions here](http://elm-lang.org/install).

## Putting Elm in the Project

Install the elm core library:
``` language-bash
$ elm package install
---------------------------------------------------------
Some new packages are needed. Here is the upgrade plan.

  Install:
    elm-lang/core 3.0.0

Do you approve of this plan? (y/n) y
Downloading elm-lang/core
Packages configured successfully!
```

Install libraries for working with the DOM:

``` language-bash
$ elm package install evancz/elm-html
---------------------------------------------------------
To install evancz/elm-html I would like to add the following
dependency to elm-package.json:

    "evancz/elm-html": "4.0.2 <= v < 5.0.0"

May I add that to elm-package.json for you? (y/n) y

Some new packages are needed. Here is the upgrade plan.

  Install:
    evancz/elm-html 4.0.2
    evancz/virtual-dom 2.1.0

Do you approve of this plan? (y/n) y
Downloading evancz/elm-html
Downloading evancz/virtual-dom
Packages configured successfully!
```

## Now A Quick Hello World
First we'll create and compile our elm module file

``` langauage-haskell
# InsuranceDropdown.elm
module InsuranceDropdown where
import Html

main =
  Html.text "Show Me the Money!!!"
```

We'll go over the salient parts in a moment. But first, let's try to compile this and view it in the browser.

``` language-bash
$ elm make InsuranceDropdown.elm --output index.html
```

If all goes well, you should see an index.html file with our text inside a div.

Here's what we've done so far:

* We created a module to contain our code with `module InsuranceDropdown where`
* We've created a `.elm` file with the same name as our module
* We imported the Html library `import Html`
* We created the function `main` that runs all of our code
* We called the text function form the Html module which created the dom for us

## Kick Up the Server
Compiling for every change can be lame. Before we start writing our app in earnest lets fire up [elm reactor](https://github.com/elm-lang/elm-reactor) in the root of our project directory.

```language-bash
$ elm reactor
---------------------------------------------------------
elm reactor 0.16.0
Listening on http://0.0.0.0:8000/
```

This gives us a listing of the project files. If we click on the file, it will automatically recompile when we refresh the page. Also, by clicking on the wrench icon, we get a [time-travelling debugger](https://github.com/elm-lang/elm-reactor#time-travel-debugging). So cool!

![](/content/images/2016/01/Screen-Shot-2016-01-28-at-2-44-06-AM-1.png)

## And NOW!   &hellip; some html
For the purpose of this demo we'll use the Twitter Bootstrap convetion. Here's what we're aiming for:
``` language-haml
 .row
  .col-sm-6
    select#InsuranceProviderId
      option
      ...
  .col-sm-6
    select#InsuranceRepId
      option
      ...
```

First, let's take a look at the [documentation](http://package.elm-lang.org/packages/evancz/elm-html/4.0.2/Html#div). According to the docs, here's how the basic tag function works:
```
div : List Attribute -> List Html -> Html
```

So we'll write the name of the tag (an elm function), pass in a list of `Attribute` objects, a list of `Html` objects, and get an `Html` object back.

A basic tag would look like:
```
Html.div [Html.Attributes.class "container"] []
```

Calling the `Html` module and the `Html.Attributes` module is going to get tiring after a while. We can change our imports so that any functions exposed in these modules can be called without the module name. This will give use something that looks much more like html.

``` language-haskell
import Html exposing(..)
import Html.Attributes exposing (..)
```

Now we can write the following:
```
div [class "container"] [
  div [class "col-sm-6"] [],
  div [class "col-sm-6"] []
  ]
```

and we should get a `.container` div and a couple of other divs inside it. Let's apply this to the rest of our code and mock up a our dropdowns.


``` language-haskell
# InsuranceDropdown.elm
module InsuranceDropdown where

import Html exposing(..)
import Html.Attributes exposing (..)

main : Html
main =
  div
      [ class "row"]
      [ div [class "col-sm6" ]
          [select [id "InsuranceProviderId"]
            [ option [value "1"] [text "Carrier 1"],
              option [value "2"] [text "Carrier 2"],
              option [value "3"] [text "Carrier 3"],
              option [value "4"] [text "Carrier 4"]
            ]
          ],
        div [ class "col-sm6" ]
          [select [ id "InsuranceCarrierId"]
            [ option [value "1"] [text "Rep 1"],
              option [value "2"] [text "Rep 2"],
              option [value "3"] [text "Rep 3"],
              option [value "4"] [text "Rep 4"]
            ]
          ]
      ]
```

# What's Up Next
At this point we have:

* Installed elm
* played with the REPL
* Looked at the local server
* compiled our elm code
* Make a quick mockup for our application code

In the [next tutorial](/tutorial-dom-manipulation-with-elm-part-2), we will make our dropdowns dynamic, read in some data and add the functionality to make them display data as they change.
