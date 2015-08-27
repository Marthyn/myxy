[![Build Status](https://travis-ci.org/Marthyn/myxy.svg?branch=master)](https://travis-ci.org/Marthyn/myxy)
[![Code Climate](https://codeclimate.com/github/Marthyn/myxy/badges/gpa.svg)](https://codeclimate.com/github/Marthyn/myxy)
# Myxy
*Short for Myxomatosis, one of my favourite Radiohead songs*

Myxy is an API wrapper written in Ruby for the great Calendar42 app.

## Calendar42
*From docs.calendar42.com*

Calendar42 is a planning ecosystem that distributes, enriches and profiles time related information. It communicates in real-time with end-users through our browser- & native apps, as well as our our other communication channels. We offer SMS text (not everyone one has a smartphone), transactional mail (nothing wrong with good old fashioned mailboxes) & native push notifications including custom templates & notification masks.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'myxy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install myxy

## Usage

First you'll need to implement an authentication part. You can use the built in authenticaton method and enter your credentials in environment variables but if you're gonna develop an app that let's other users login then you should build an HTML page where users can enter credentials and login to their Calendar42 account. Then you'll only have to set the `Myxy.config.api_token`.

### Resources in this Gem

#### Events

e.g.

```ruby
Myxy::Event.all
```
Will return all events.

```ruby
Myxy::Event.where(type: 'todo')
```
Will return all events of the type todo.

```ruby
Myxy::Event.find_by(title: 'Dinner at the restaurant at the end of the Universe')
```
Will return the event with that title if it exists.

```ruby
Myxy::Event.find(1)
```
Will return the event with id 1 if it exists.

## TODO

  * Demo application
  * Subscriptions
  * Locations
  * Services
  * Relationships
  * Actors/Persons

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing
*You know the drill*

1. Fork it ( https://github.com/[my-github-username]/myxy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Testing

We use Rspec for normal unit testing. We aim for coverage above 90%. Also the current suite should succeed when you commit something.
We use Rubocop for style checking, this should also succeed before you commit anything.

We're also experimenting with Mutation testing, which alters your code to test if your specs fail when there's faulty code. This is important when you
alter a vital part of the code, make sure the mutation percentage is higher than 80%. To run a part of the code with mutant run the follwing
`mutant --include lib/myxy --require myxy --use rspec Myxy::ClassYoureWorkingOn`

When you're editing code it's advised you run guard, which watches file changes and automatically runs Rspec and Rubocop.

## Me

[I've](http://www.marthyn.nl) created this gem because I like doing it but also because I believe in Calendar42 as a product.

[![forthebadge](http://forthebadge.com/images/badges/built-with-ruby.svg)](http://www.marthyn.nl)
