# Project 2 Rails API

## Approach

The original concept of this app was to build a craigslist-style classifieds app with the following models
--* User
--* Post
--* Reply
--* Category
--* Categorizations


I prioritized the first 3 models and set the categorization feature as a stretch goal. Due to some time-consuming setbacks, the categorization feature did not get implemented. Without categories, this app functions as a basic blog with users, posts and replies.

I began by building those 3 models and their generic controllers. Once I tested them in the console, I build basic html inputs so I could build corresponding ajax requests for the CRUD actions.

Once I had basic CRUD between front and back end, I implemented handlebars.js to build the blog template.

Next I implemented user authorization, and build corresponding html forms. With that in place I worked on customizing my controllers to allow & disallow actions depending on the login status.



## Challenges

My biggest challenges in this app were features surrounding user logins. With the example authorization code, the concept was fairly straight forward, but implementing user-specific features wound up being the most time consuming aspect of the project.

In particular, attempting to access controller variables from within the rails serializers, which was my initial approach for building user-specific templates, cost a lot of time and ultimately was not achieved. Instead I was able to move forward by storing user information in the browser's localStorage, and comparing IDs to corresponding data attributes on the posts, replies and delete buttons.


http://jamesstaub.github.io/hasslefieds-app/
