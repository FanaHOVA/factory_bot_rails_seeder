# factory_bot_rails_seeder

You can use this gem to create factories for all of your ActiveRecord classes. We generate the list by looking at `ApplicationRecord`, so they need to inherit from it. There's also an option to manually pass classes, or manually exclude them. This is a very hacky version right now so use at your own risk :)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'factory_bot_rails_seeder'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install factory_bot_rails_seeder

## Usage

In your Rails console:

```
FactoryBotRailsSeeder.generate_for_all_classes
```

That's it. If you have existing factories, it will ask you if you want to override it or not. 

If you want to generate factories only for select classes you can do this:

```
FactoryBotRailsSeeder.generate_only_for([User, Startup])
```

If you want to generate factories for ALL classes EXCEPT some:

```
FactoryBotRailsSeeder.generate_for_all_but([User, Startup])
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fanahova/factory_bot_rails_seeder.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
