# Bullseye!

An *extremely quickly written* shoot-from-the-hip implementation of [so-called Garber-Irish DOM-ready execution](http://viget.com/inspire/extending-paul-irishs-comprehensive-dom-ready-execution)
for the Rails asset pipeline. Even provides functionalty for Sass to target those pages! Could work with other Sprockets stuff down the road, too. But for now, it's
pretty married to Rails. Also, needs tests for the exactly four things that it does. Anyone wanna add exactly four Cucumber features?

## Why?

I got sick of on-page JavaScript. Also I like using the Asset Pipeline for what it's actually intended for,
reducing the number of HTTP requests. Finally, targeting pages in Sass should be easy.

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
//= require jquery
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

Want to use the same JavaScript for two actions, say `new` and `edit`? Put both actions in the filename separated by a dash:

``` coffeescript
# app/assets/javascripts/bullseye/sites/new-edit.bullseye.coffee

alert "I appear on both the new and edit actions"
```

Want to target that page in your Sass? Use a little string interpolation and a function that generates a selector:

``` sass
#{bullseye('sites/show')} {
  background-color: green;
}
```

Piece of cake.

### Fuzzy search

Plugging Bullseye into an existing app may require making Bullseye work a little harder to target pages.
For instance, you can use Bullseye with ActiveAdmin to target particular actions on models.
However, you can't really add your own `body` tag to their templates. Luckily, they do put in both
the action and controller names in the `class` attribute of the `body` tag.

Create an initializer, like `config/initializers/bullseye.rb` and add the following:

``` ruby
Bullseye.configure do |config|
  config.fuzzy_search = %{$('body').get(0).classNames.split(/\\s+/)}
  config.css_selector = 'body.:action.:controller'
  config.html_tag = { 'class' => ':action :controller' }
end
```

Then you can make your `controller/action.bullseye` files and everything should just work.

## Force the name of the controller/action

For things like error handling in `rescue_from`, you can force the `action` and `controller` that
Bullseye will use:

``` ruby
rescue_from StandardError do |e|
  bullseye_target 'application/errors/http_500'

  render 'http_500'
end
```

This will resolve to the controller `application/errors` and the action `http_500` in the Bullseye
HTML `body` tag for that page.

## Hacking

_You'll need to install [Penchant](http://github.com/johnbintz/penchant) to mess with the Gemfile
during development.

