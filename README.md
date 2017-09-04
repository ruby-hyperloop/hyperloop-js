#  Hyperloop JS

TODO: Docs about router

### Hyperloop.js

Hyperloop client-side including:

+ Hyperloop Components
+ Hyperloop Stores
+ Hyperloop Operations
+ Hyper-Router (React Router v4 DSL wrapper)
+ Opal Active Support, Opal JQuery

Note: React, ReactDOM, ReactRouter and JQuery are not included. You will need to provide these.

### Hyperloop-compiler.js

Compiles code in your browser. Client-side Hyperloop and Opal for static sites or fast prototyping, with no backend or build process needed.

+ Ruby code in your HTML pages is compiled into JavaScript on page load
+ You can work with Hyperloop Components, Stores, Operations and HyperRouter
+ No backend dependency or setup required

<!-- ### Opal.js

+ Latest build of Opal. Include this file or bring your own. -->

## Documentation and Help

+ Please see the [ruby-hyperloop.io](http://ruby-hyperloop.io/) website for documentation
+ Join the Hyperloop [gitter.io](https://gitter.im/ruby-hyperloop/chat) chat for help and support

See [VERSIONS](https://github.com/ruby-hyperloop/hyperloop-js/blob/master/VERSIONS.md) for the version numbers of the included Gems.

## How it works

#### Hyperloop.js

##### Front-end

Hyperloop-js includes Hyperloop's client side Components, Operations, Stores and Hyper-Router.

##### Back-end

You will need a backend to build the Hyperloop code you write.

+ Hyperloop Gem for Rails integration
+ Opal Sprockets for Rack backend
+ Simple Opal Rake rask

See Installation options on http://ruby-hyperloop.io/

##### No back-end

If you do not want a backend then you can use Hyperloop-compiler.js to compile code in your browser.

#### Hyperloop-Compiler.js

Your ruby code will be compiled by the browser into JavaScript and executed.  Any compilation or runtime errors will be briefly reported to the console.

## How to use

### Hyperloop-JS

Add the following to your HTML page:

```html
<head>
  <!-- React and JQuery (or bring your own) -->
  <script src="https://unpkg.com/react@15/dist/react.min.js"></script>
  <script src="https://unpkg.com/react-dom@15/dist/react-dom.min.js"></script>
  <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

  <!-- React Router (if you are using it) -->
  <script src="https://unpkg.com/react-router/umd/react-router.min.js"></script>

  <!-- Opal (or bring your own) -->
  <script src="http://cdn.opalrb.org/opal/current/opal.min.js"></script>

  <!-- Hyperloop-js -->
  <script src="https://rawgit.com/ruby-hyperloop/hyperloop-js/refactor/dist/hyperloop.min.js"></script>
</head>
```

That is all you need for Hyperloop Components, Stores, Operations and Router client-side. If you have a back-end building Hyperloop code you are good to go.

If you want to do in browser compiling then follow the next step.

### Hyperloop-compiler

Complete the Hyperloop-JS step above then add the following to your HTML page:

```html
<head>
  <!-- Hyperloop-compiler (only needed if you are doing in browser compiling) -->
  <script src="https://rawgit.com/ruby-hyperloop/hyperloop-js/refactor/dist/hyperloop-compiler.min.js"></script>
</head>
```

Specify your ruby code inside script tags or link to your ruby code using the src attribute `<script type="text/ruby" src=.../>`

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

#### Example

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

Copy the code above into an `index.html` file and launch a simple web server with `ruby -run -e httpd . -p 8000` (or if you prefer Python) `python -m SimpleHTTPServer` then navigate to  http://localhost:8000/

#### Want a larger example?  

The [Hyperloop website](http://ruby-hyperloop.io/) and [ChatRoom application and tutorial](http://ruby-hyperloop.io/tutorials/chat_app/) uses hyperloop-js.

#### Trying it out using GitHub

Github makes a great sandbox to try out small Hyperloop online with nothing but your browser.

Have a look at the instructions here: https://pages.github.com/

Rather than "cloning" the repo, and editing your files on your computer you can just create and edit files right on the GitHub site.

#### Mounting Components

hyperloop-js will directly mount components onto DOM elements that have the `data-hyperloop-mount` attribute.  The attribute value should be the fully qualified name of the component.  For example "MyComponent".  Any additional data attributes will be passed as params to the component.  The attribute names will be snake cased (i.e. `data-foo-bar` becomes the `foo_bar` key)

## Building and Contributing

To build, clone the repo, run `bundle install` and then `bundle exec rake`

This will combine all the pieces and build `hyperloop.js`, `hyperloop.min.js`, `opal-compiler.js` and `opal-compiler.min.js`.

Contributions are most welcome!
