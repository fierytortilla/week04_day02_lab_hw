# MVC

## Learning Objectives

- Know that MVC is a commonly used pattern in software development
- Know the roles of models, views and controllers

##### Duration 20 mins

## Introduction

Last week we were working with databases and writing classes in Ruby which interacted with those databases.

But... we don't have much to show for it. We have a whole _bunch_ of ruby classes tests, and _maybe_ a `console.rb` file where we wrote Ruby code where we created objects and saved them to the database. 

We now need to think about how our users interact with our apps. We need to build a user interface.

This is a big problem to solve! We have a few design concerns to stick to:

## Design Concerns

- **We must keep our business logic separate from our user interface.** If we want to change the interface, we should not have to also change the actual logic of the app.

- **We want to reuse our code when possible.** We know that if we model a Bear, River or Fish once, we can make as many bears, rivers and fish as we want. Similarly, if we can build a web page once, we should be able to reuse that web page to display any data. (e.g. You don't write a blog by writing multiple pages, you write a single blog page and populate it with different text for each post)

- **We want our apps to remember data between runs.** Right now we run our apps, they do their thing, and then they're done! There is no way of storing data, or reading back data that has been stored. This is probably fine for Terminal apps, but makes no sense for web apps. We don't want to have to make a new Bear, River and Fish every time we log in to our ecosystem!

When we are dealing with web apps, there are many ways we can structure the code.  In the past, there have been many ways to do this e.g. the flat structure of PHP or the front end - back end code files of ASP.NET which tie a given piece of C# to a front end html file. The problem with these patterns is that they often result in clunky, long code files and messy html littered with logic. To address this problem, MVC came along.

## The MVC Pattern

MVC stands for Model, View, Controller, which refers to very abstract terms for the three components of an MVC app:

> Draw in circles on board:
```
              (Models)
             /
(Controllers)
             \
              (Views)
```

- **Models** - the business logic behind the app, the actual functionality of it.
- **Views** - the bits of the app that a user actually sees and can interact with.
- **Controllers** - responsible for binding the functionality of models to the users' interactions with views.

The good news is that you already know how to build an app's models. This is just a fancy term for classes and functions, and you've been building and testing Ruby classes and functions for three weeks now. You've got this covered.

They are called models because not every language uses the word "class" here. Ruby does, and so does Python, but JavaScript calls them prototypes. Some languages give us other types of models, for example Java has not only classes but interfaces, enums... But we're getting ahead of ourselves. For now, "models" is just a general term for classes.

You can also build an app's views already. Since we are targeting the web, the app's views are just going to be simple HTML and CSS, as you've built on the pre-course (there will be a refresher!). We have only one trick to add, and that is to inject Ruby code _straight into_ our HTML and CSS.

And that just leaves the controller. And really this is so much more simple than you might think. Using a Ruby framework called Sinatra, we're able to run a web server and give it instructions like, "When a user does _that_, get _this_ data and put it _here_."

## Flow

With MVC, the client inputs a url which is picked up by our application and handled by a Controller. The controller is responsible for deciding what to do when a given 'route' is matched (a route being a pairing of a HTTP VERB and a path '/cats' etc). Next, the controller may create / fetch whichever Model it needs to bundle up the data / logic which is necessary for the page to be rendered. Lastly, this Model is passed to a View where the model is accessed to render the information to the page.

### Example

To give a concrete example, check out the world famous [Random Kitten Generator](http://www.randomkittengenerator.com/). This simple app has the following flow:

> Draw arrows on board as you walk through this:

- When the page is loaded, the app's **controller** makes a call to the Kitten image **model** for the URL to a random kitten image.
- The URL is passed back to the **controller**, which injects it into an HTML `<img>` tag's `src` attribute inside the app's **view**.
- When the user clicks on the image in the **view**, an event is triggered in the **controller** that fetches another random image URL from the **model**, and the cycle repeats itself.

## The data

The only question then, is where does the random kitten image come from? Well, maybe the developers just have a huge list of image URLs hard-coded into their app. But if they're sensible, they have these URLs stored in a database, and they query this database whenever they need a random kitten.

> Draw database on board, connected to `(Models)`

This is what we covered last week when we had our SQL database and wrote Ruby classes which interacted with the database.

This week we will build the controller and views that will round out our web app. Hold on to your butts!




