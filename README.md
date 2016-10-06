# IRBAppEnvPrompt

Clarify which app you're talking to.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'irb_app_env_prompt', require: false
```

And then execute:

    $ bundle

## Usage

Add this to your app's irbrc:
- either put .irbrc in HOME
- or set the env var IRBRC to this file

```ruby
require "irb_app_env_prompt"

IRBAppEnvPrompt.configure("app_name", Rails.env)
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

