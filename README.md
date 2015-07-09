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

First you'll need to implement an authentication part. You can use the built in authenticaton method and enter your credentials in environment variables but if you're gonna develop an app that let's other users login then you should build an HTML page where users can enter credentials and login to their Calendar42 account. Then you'll only have to set the `Myxy.config.auth_token`.

### Resources in this Gem

#### Events

#### Calendars

#### Location

### Resources in the future

#### Subscriptions for events and calendars

#### Users

#### Positions

No code yet =)

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
