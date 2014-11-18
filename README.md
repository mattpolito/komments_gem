[![Gem Version](http://img.shields.io/gem/v/komments.svg?style=flat)](http://badge.fury.io/rb/komments)
[![Build Status](http://img.shields.io/travis/mattpolito/komments_gem/master.svg?style=flat)](https://travis-ci.org/mattpolito/komments_gem)
[![Code Climate](http://img.shields.io/codeclimate/github/mattpolito/komments_gem.svg?style=flat)](https://codeclimate.com/github/mattpolito/komments_gem)

Ruby wrapper to get configured with the commenting engine, [Komments][]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'komments'
```

And then execute:

```shell
bundle
```

Or install it yourself as:

```shell
gem install komments
```

## Usage

Currently the main functionality of this library is to configure your api key so that your personalized site url can be generated.

To do this:

```ruby
Komments.configure do |config|
  config.api_key = 'API_KEY_GOES_HERE'
end
```

Would be the most straight forward way to go about this. If this were being used in a [Rails][] project, I would recommend putting this in your `config/initializers` directory.

Now that your credentials are out of the way, you'll be able to call:

```ruby
Komments.website_url
```

This will provide your site's url to [Komments][]. Add that to a `script` tag in your template and you will be good to go.

```erb
<script async="async" src=<%= Komments.website_url %>></script>

```

That will end up looking this this:


```html
<script async="async" src="//komments.net/embed/{API_KEY_GOES_HERE}"></script>
```

# Rails Usage

If you happen to be integrating Komments into your Rails application, you're covered as well.

When a Rails app is detected, you'll gain access to the `komments_script_tag` helper.

```ruby
<%= komments_script_tag %>
```

Which will render out to:

```html
<script async="async" src="//komments.net/embed/{API_KEY_GOES_HERE}"></script>
```

And if you [don't want the script to be loaded asynchronously][async vs defer]...

```ruby
<%= komments_script_tag(false) %>
```

Which will render out to:

```html
<script defer="defer" src="//komments.net/embed/{API_KEY_GOES_HERE}"></script>
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/komments/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[Komments]: http://komments.net
[Rails]: http://rubyonrails.org
[async vs defer]: http://www.growingwiththeweb.com/2014/02/async-vs-defer-attributes.html
