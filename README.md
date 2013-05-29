# ObjectiveJuice

Convert the object to the objective-c literal

## Installation

Add this line to your application's Gemfile:

    gem 'objective_juice'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install objective_juice

## Usage

sample code
```ruby

require "objective_juice"

hash = {"objectve-c" => "is fantastic", "literal-syntax" => ["string", "array", "number", "hash"]}

objc_literal_string = ObjectiveJuice.splash(hash)

print objc_literal_string + "\n"
```

output
```text
@{
    @"literal-syntax":@[@"string", @"array", @"number", @"hash"],
    @"objectve-c":@"is fantastic"
}

```

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
