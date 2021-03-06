# ScoutSignalfx

[![Build Status](https://travis-ci.org/scoutapp/scout_signalfx_ruby.svg?branch=master)](https://travis-ci.org/scoutapp/scout_signalfx_ruby)

Bring key health metrics for your Ruby on Rails app(s) into [SignalFx](https://signalfx.com/) with the `scout_signalfx` gem. The gem extends the [Scout](https://scoutapp.com) Ruby gem, which gathers detailed performance on every web request, and sends those metrics direct to SignalFx.

A [Scout](https://scoutapp.com) account isn't required, but it certainly makes performance investigations more fun.

![signalfx dash](https://s3-us-west-1.amazonaws.com/scout-blog/scout_signalfx/signalfx_dash.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scout_signalfx'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scout_signalfx

## Configuration

__Add a `config/initializers/scout_signalfx.rb` file to your Rails app:__

```ruby
SIGNAL_FX_CLIENT = SignalFx.new("[SIGNAL_FX_TOKEN]")
ScoutSignalfx.configure(SIGNAL_FX_CLIENT)
```

Your SignalFx API access token can be obtained from the SignalFx organization you want to report data into.

__Add a `config/scout_apm.yml` file to your Rails app:__

```yaml
common: &defaults
  monitor: true

development:
  <<: *defaults
  monitor: false # set to true to test in your development environment

production:
  <<: *defaults
```

_This step isn't required if you're an existing Scout customer._

[See the Scout docs](http://help.apm.scoutapp.com/#ruby-agent) for advanced configuration instructions.

The Scout gem auto-magically instruments your controller-actions. There's no more steps!

## Metric Schema

The following metrics are reported once per-minute:

* web.duration_ms
* web.count
* web.errors_count

Each metric has the following dimensions:

* app - The name of the app
* host - The hostname of the running app
* transaction - The name of the transaction. For example, `UsersController#index` becomes `users.index` in SignalFx.

## Tests

```ruby
rake
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/scoutapp/scout_signalfx_ruby.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
