#  Hyperloop JS

Client-side Hyperloop and Opal for static sites or prototyping, with no backend or build process needed. Ruby code in your HTML pages is compiled into JavaScript on page load. You can work with Hyperloop Components, Stores and Operations with no back-end dependancy or setup.

## How it works

Your ruby code will be compiled by the browser into JavaScript, and executed.  Any compilation or runtime errors will be briefly reported to the console.

You can write any Ruby code supported by Opal and access JavaScript libraries from within your Ruby code.

Ruby classes can subclass `Hyperloop::Component` to become React components, `Hyperloop::Store` to become Stores, and `Hyperloop::Operation` to become client-side Operations and then use the Hyperloop DSL to dynamically generate reactive DOM nodes, mutate state and dispatch messages.

## What is included

+ Opal (Ruby to Javascript Transpiler)
+ Opal-Jquery (Ruby Jquery wrapper, including HTTP, timers, and of course DOM queries)
+ Hyperloop Components (Ruby React.js wrapper)
+ Hyperloop Stores (Much like Flux Stores, they hold state)
+ Hyperloop Operations (Operations dispatch messages to Stores to mutate data)
+ Hyperloop Auto Import (automatically imports JS components to Ruby)

**Note** Hyperloop is dependant on React and JQuery.

## How to use

1. Add React, JQuery, `hyperloop.js` and `opal-compiler.js` to your HTML page:

```
!-- React and JQuery -->
<script src="https://unpkg.com/react@15/dist/react.min.js"></script>
<script src="https://unpkg.com/react-dom@15/dist/react-dom.min.js"></script>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

!-- Opal and Hyperloop -->
<script src="https://rawgit.com/ruby-hyperloop/hyperloop-js/opal-compiler.min.js"></script>
<script src="https://rawgit.com/ruby-hyperloop/hyperloop-js/hyperloop.min.js"></script>
```

2. Specify your ruby code inside of `<script type="text/ruby">...</script>` tags or link to your ruby code using the src attribute `<script type="text/ruby" src=.../>`


## Example

See this example in action here: http://hyperloop.id.github.io/hyperloop-express/

index.html:
``` html
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Hyperloop-Express Demo</title>
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://rawgit.com/hyperloop.id/hyperloop-express/master/hyperloop-express.js"></script>

    <!-- ruby scripts can be fetched from the server or other remote source -->
    <script type="text/ruby" src="clock.rb"></script>

    <!-- or the ruby code can specified directly inline -->
    <script type="text/ruby">
    Element['#clock'].render do
      Clock format: 'The time is: %a, %e %b %Y %H:%M:%S %z'
    end
    </script>

  </head>
  <body>
    <div id="clock"></div>
    <!--

    instead of using Element[...].render to attach a top level component, you
    can specify the react component and parameters using data- tags:

    <div data-reactrb-mount="Clock"
         data-format="The time is: %a, %e %b %Y %H:%M:%S %z">
    </div>

    -->
  </body>
</html>
```

```ruby
# clock.rb:  Displays the current time
class Clock < React::Component::Base
  param format: '%a, %e %b %Y %H:%M'
  before_mount do
    state.time! Time.now.strftime(params.format)
    every(1) { state.time! Time.now.strftime(params.format) }
  end

  def render
    state.time
  end
end
```

# Want a larger example?  

The Hyperloop website and [ChatRoom application and tutorial](http://ruby-hyperloop.io/tutorials/chat_app/) uses Hyperloop-Express.

# Trying it out using github

Github makes a great sandbox to try out small Hyperloop online with nothing but your browser.

Have a look at the instructions here: https://pages.github.com/

but rather than "cloning" the repo, and editing your files on your computer
you can just create and edit files right on the github site.

# Mounting Components

In addition to the standard ways to mount top level components hyperloop-express will directly mount components onto DOM elements that have the `data-hyperloop-mount` attribute.  The attribute value should be the fully qualified name of the component.  For example "Clock".  Any additional data attributes will be passed as params to the component.  The attribute names will be snake cased (i.e. `data-foo-bar` becomes the `foo_bar` key)

# Building and Contributing

To build, clone the repo, run `bundle install` and then `bundle exec rake`

This will combine all the pieces and build the `hyperloop-express.js` file.

To be sure we have no ruby dependencies we use this server for smoke testing:

`python -m SimpleHTTPServer 4000`

Contributions are welcome - things we need:

+ Examples
+ Some test cases
+ Minimization
