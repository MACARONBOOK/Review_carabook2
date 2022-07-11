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
* write on book.rb<br>
  scope :latest, -> {order(created_at: :desc)}<br>
  scope :old, -> {order(created_at: :asc)}<br>
  scope :star_count, -> {order(star: :desc)}
  
* edit index-action on BookCon<br>
  if params[:latest]<br>
     @books = Book.latest<br>
  elsif params[:old]<br>
     @books = Book.old<br>
  elsif params[:star_count]<br>
    @books = Book.star_count<br>
  else<br>
    @books = Book.all<br>
  end

* add link to books/index ※remove<><br>
  p<br>
   %= link_to '新しい順', books_path(latest: "true") %<br>
  | %= link_to '古い順', books_path(old: "true") %<br>
  | %= link_to '評価の高い順', books_path(star_count: "true") %<br>
  /p
* change time-zone & add default at config/application.rb<br>
  config.time_zone = 'Asia/Tokyo'<br>
  config.i18n.default_locale = :ja

* add created-date-time on books/index ※remove<><br>
   td  %= l book.created_at %  /td       ← 1 method can display jpn-time
   
* create config/locales/ja.yml<br>
  ja:<br>
  time:<br>
    formats:<br>
      default: "%Y/%m/%d %H:%M:%S"

