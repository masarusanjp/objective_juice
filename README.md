objective_juice
===============

Convert an object to objective-c literal


# Usage

```ruby

require "objective_juice"

hash = {"objectve-c" => "is fantastic", "literal-syntax" => ["string", "array", "number", "hash"]}

objc_literal_string = ObjectiveJuice.splash(hash)

print objc_literal_string + "\n"

```
