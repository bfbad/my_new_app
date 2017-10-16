# Brandon's Bike Shop
## A demo e-commerce web application created with Ruby on Rails

Hosted on [heroku](https://brandonsbikes.herokuapp.com)

+ JQuery, Sass, HTML, Bootstrap
+ Payment processing using Stripe (demo mode only)
+ Testing in RSpec with FactoryGirl
+ Will_paginate for comment pagination
+ Redis, PostgreSQL
+ Account management and admin features built on devise.

Features:

+ Featured products carousel
+ Homepage includes latest 5-star-comment stored in Redis.
+ Product list built using Bootstrap grid system.
+ Raty implementation to track each product's average rating.
+ User creation allowing for comments.
+ Payments handled with stripe
+ Search
+ Contact form
+ Administrative tools to delete inappropriate comments.

##Installation##
+ Clone repository
+ Run `bundle install`
+ Install and run a redis server - [Download here](https://redis.io/download)
