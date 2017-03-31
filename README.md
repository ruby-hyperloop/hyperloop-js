#  Hyperloop JS

Client-side Hyperloop and Opal for static sites or fast prototyping, with no backend or build process needed.

+ Ruby code in your HTML pages is compiled into JavaScript on page load
+ You can work with Hyperloop Components, Stores, and Operations
+ No backend dependency or setup required

## Documentation and Help

+ Please see the [ruby-hyperloop.io](http://ruby-hyperloop.io/) website for documentation
+ Join the Hyperloop [gitter.io](https://gitter.im/ruby-hyperloop/chat) chat for help and support

## How it works

Your ruby code will be compiled by the browser into JavaScript and executed.  Any compilation or runtime errors will be briefly reported to the console.

You can write any Ruby code supported by Opal and access JavaScript libraries from within your Ruby code.

Ruby classes can subclass `Hyperloop::Component` to become React components, `Hyperloop::Store` to become Stores, and `Hyperloop::Operation` to become client-side Operations and then use the Hyperloop DSL to dynamically generate reactive DOM nodes, mutate state and dispatch messages.

## What is included

+ Opal (Ruby to Javascript Transpiler)
+ Opal-Jquery (Ruby Jquery wrapper, including HTTP, timers, and of course DOM queries)
+ Hyperloop Components (Ruby React.js wrapper)
+ Hyperloop Stores (Much like Flux Stores, they hold state)
+ Hyperloop Operations (Operations dispatch messages to Stores to mutate data)
+ Hyperloop Auto Import (automatically imports JS components to Ruby)

**Note** Hyperloop is dependent on React and JQuery.

See [VERSIONS](https://github.com/ruby-hyperloop/hyperloop-js/blob/master/VERSIONS.md) for the version numbers of the included Gems.

## How to use

First add React, JQuery, `hyperloop.js` and `opal-compiler.js` to your HTML page:

```html
<head>
  <!-- React and JQuery -->
  <script src="https://unpkg.com/react@15/dist/react.min.js"></script>
  <script src="https://unpkg.com/react-dom@15/dist/react-dom.min.js"></script>
  <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

  <!-- Opal and Hyperloop -->
  <script src="https://rawgit.com/ruby-hyperloop/hyperloop-js/master/opal-compiler.min.js"></script>
  <script src="https://rawgit.com/ruby-hyperloop/hyperloop-js/master/hyperloop.min.js"></script>
</head>
```

Next, specify your ruby code inside script tags or link to your ruby code using the src attribute `<script type="text/ruby" src=.../>`

```html
<head>
  <script type="text/ruby">...</script>
</head>
```

Finally, mount your Component(s) as a DOM element and specify the Component and parameters using data- tags:

```html
<body>
  <div data-hyperloop-mount="SayHello"
       data-name="World">
  </div>
</body>
```
Note: For a Single Page Application (SPA) you would only mount your first (top-level) Component and that would render all subsequent Components.

## Example

There is a live demo page here (index.html in this repo): [https://ruby-hyperloop.github.io/hyperloop-js/](https://ruby-hyperloop.github.io/hyperloop-js/)

Here is a simple index.html:
```ruby
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Hyperloop-JS Demo</title>

    <!-- React and JQuery -->
    <script src="https://unpkg.com/react@15/dist/react.min.js"></script>
    <script src="https://unpkg.com/react-dom@15/dist/react-dom.min.js"></script>
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

    <!-- Opal and Hyperloop -->
    <script src="https://rawgit.com/ruby-hyperloop/hyperloop-js/master/opal-compiler.min.js"></script>
    <script src="https://rawgit.com/ruby-hyperloop/hyperloop-js/master/hyperloop.min.js"></script>

    <script type="text/ruby">
      class SimpleComponent < Hyperloop::Component
        render(DIV) do
          BUTTON { 'Push the button' }.on(:click) do
           alert 'You did it!'
          end
        end
      end
    </script>
  </head>

  <body>
  <div data-hyperloop-mount="SimpleComponent">
  </div>
  </body>
</html>
```

Copy the code above into an `index.html` file and launch a simple web server with `ruby -run -e httpd . -p 8000` then navigate to  http://localhost:8000/

### Want a larger example?  

The [Hyperloop website](http://ruby-hyperloop.io/) and [ChatRoom application and tutorial](http://ruby-hyperloop.io/tutorials/chat_app/) uses hyperloop-js.

### Trying it out using GitHub

Github makes a great sandbox to try out small Hyperloop online with nothing but your browser.

Have a look at the instructions here: https://pages.github.com/

Rather than "cloning" the repo, and editing your files on your computer you can just create and edit files right on the GitHub site.

## Mounting Components

hyperloop-js will directly mount components onto DOM elements that have the `data-hyperloop-mount` attribute.  The attribute value should be the fully qualified name of the component.  For example "MyComponent".  Any additional data attributes will be passed as params to the component.  The attribute names will be snake cased (i.e. `data-foo-bar` becomes the `foo_bar` key)

## Building and Contributing

To build, clone the repo, run `bundle install` and then `bundle exec rake`

This will combine all the pieces and build `hyperloop.js`, `hyperloop.min.js`, `opal-compiler.js` and `opal-compiler.min.js`.

Contributions are most welcome!
