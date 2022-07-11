# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Review_carabook
* first commit → add star-Review to format
* second commit → add & update README
* third commit → add change-order

## star-Review_function
* add jQuery<br>
  yarn add jquery
* + config/wepack/environment.js<br>
  const webpack = require('webpack')<br>
  environment.plugins.prepend(<br>
  'Provide',<br>
  new webpack.ProvidePlugin({<br>
    $: 'jquery/src/jquery',<br>
    jQuery: 'jquery/src/jquery',<br>
    jquery: 'jquery/src/jquery',<br>
  })
* + javascript/packs/application.js<br>
    change→ import jQuery from "jquery"<br>
    new→ global.$ = jQuery;<br>
         window.$ = window.jQuery = require('jquery');<br>
         require('packs/raty')
* add Raty.js
* + download star-image & put on assets/images<br>
  https://github.com/wbotelhos/raty/tree/master/lib/images
* + create raty.js at app/javascript/packs & copy-paste<br>
  https://github.com/wbotelhos/raty/blob/master/lib/jquery.raty.js
  
* add column on Books model by migrate<br>
  rails g migration AddStarToBooks star:string ←other name is ok(category...etc)<br>
  →migrate

* permit new-column by BookCon<br>
  params.require.........permit(:star)

* add description to views
* + books/form<br>
  -- bottom of form --  

* + books/show<br>
  -- above edit/destroy-button --

* + books/index<br>
  -- above book_comments-count --
  
* + books/edit(release from form)<br>
  -- bottom of form_with --<br>
  differ-point with books/form<br>
  →ReadOnly:~ , score:~<br>
  
## change_order_function(latest/old/star_count)
