# Bullseye!

An *extremely fast* shoot-from-the-hip implementation of [so-called Garber-Irish DOM-ready execution](http://viget.com/inspire/extending-paul-irishs-comprehensive-dom-ready-execution)
for the Rails asset pipeline. Could work with other Sprockets stuff down the road, too. But for now, it's
pretty married to Rails. Also, needs tests for the exactly four things that it does. Anyone wanna add exactly four Cucumber features?

## Why?

I got sick of on-page JavaScript. Also I like using the Asset Pipeline for what it's actually intended for,
reducing the number of HTTP requests.

## How?

Add the gem:

``` ruby
gem 'bullseye'
```

Replace your `body` tag in your layout with:

``` haml
!!!
%html
  = bullseye_body do
    = yield
```

That adds `data-action` and `data-controller` attributes to your `body` tag automagically. The controller
comes from `ActionController::Base.controller_path`, so it's the full namespaced underscored path (`Admin::UsersController`
becomes `admin/users`).

Then, in `application.js`:

``` javascript
//= require bullseye
```

Finally, create some controller/actions-specific files within `app/assets/javascripts/bullseye`
and give them the extenstion `.bullseye`. For instance, target `SitesController#show` in JS and CoffeeScript:

``` javascript
// app/assets/javascripts/bullseye/sites/show.bullseye

alert("I am showing a site");
```

``` coffeescript
# app/assets/javascripts/bullseye/sites/show.bullseye.coffee

alert "I am also showing a site"
```

Piece of cake.
