# FullyFreeze

This gem is created in recognition of two hot topics in Ruby programming.

Namely:

* Multi-threaded programming with guilds.
* Functional programming.

While these topics are outside the scope of this gem, both are facilitated by
the concept of treating data as immutable, pure values.

While many data types in Ruby are immutable, many are not. Further, while the
freeze method is provided to make data immutable, and the frozen? method can be
used to determine if data is immutable, neither of these methods digs down into
the interior of the object to make those data immutable as well.

The fully_freeze gem does not take such half measures. Instead it digs deep
into the objects and gets the job done!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fully_freeze'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fully_freeze

## Usage

    require 'fully_freeze'

Then when a deep freeze is needed use:

    foo = my_object.fully_freeze

and to determine if that data is really immutable, use:

    if my_object.fully_frozen?
      # etc etc etc...
    end

And that is all there is too it!

*Note:* While this gem does employ monkey-patching, no existing methods are
modified, so the risk level is low.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

OR...

* Make a suggestion by raising an
 [issue](https://github.com/PeterCamilleri/fully_freeze/issues)
. All ideas and comments are welcome.

## License

The gem is available as open source under the terms of the
[MIT License](./LICENSE.txt).

## Code of Conduct

Everyone interacting in the fully_freeze project’s codebases, issue trackers,
chat rooms and mailing lists is expected to follow the
[code of conduct](./CODE_OF_CONDUCT.md).
