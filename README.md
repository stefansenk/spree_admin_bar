Spree Admin Bar for Spree 3.0.0
===============

[![Build Status](https://travis-ci.org/QuintinAdam/spree_admin_bar.svg)](https://travis-ci.org/QuintinAdam/spree_admin_bar)

Forked from stefansenk.

Adds an admin bar to a [Spree](http://github.com/spree/spree) E-Commerce platform shop front-end, allowing an admin user to quickly navigate to the relevant sections within the site admin pages.

The admin bar gets displayed at the top of each page to users logged in as an admin. It works with following the entities:
* Products
* Taxons/Taxonomies
* Pages  ([Spree Static Content](https://github.com/spree/spree_static_content)) - not implemented yet in version 3.0.0
* Related Products  ([Spree Related Products](https://github.com/spree/spree_related_products)) - not implemented yet in version 3.0.0

Product page screenshot:

![Screenshot](https://raw.github.com/stefansenk/spree_admin_bar/master/screenshot.png)


Background
----------

We found this simple admin bar really speeds up working on a Spree site. When browsing the site front end, we often found we wanted to jump to the relevant section in the admin to make a small change. This admin bar greatly speeds up the time it takes to navigate to the relevant section in the admin.


Installation
------------

Add to your Gemfile:

```ruby
gem 'spree_admin_bar', github: 'QuintinAdam/spree_admin_bar'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_admin_bar:install
```

or just add `*= require spree/frontend/spree_admin_bar`

to `/vendor/assets/stylesheets/spree/frontend/all.css`


Testing
-------

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```


Copyright (c) 2013 Stefan Senk, released under the New BSD License
