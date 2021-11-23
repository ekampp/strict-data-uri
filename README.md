# Strict::Data::Uri

This en- and decodes data URIs.

This was inspired by [data-uri](https://rubygems.org/gems/data-uri). The main difference being (a) more precise error handling and (b) using Ruby's `Base64.strict_encode64` instead of `Base64.encode64` which prevents the addition of newline (`\n`) characters every 60 characters in the encoded string.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'strict-data-uri'
```

And then execute:

```bash
bundle install
```

## Usage

Encode a string into a data URI:

```ruby
Strict::Data::Uri.encode "string"
# => data:text/plain;base64,c3RyaW5n
```

Decode a data URI:

```ruby
Strict::Data::Uri.decode "data:text/plain;base64,c3RyaW5n"
# => string
```

## Testing

To run the tests:

```bash
bundle exec rake
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/strict-data-uri.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
