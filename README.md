# CANQL [![Build Status](https://travis-ci.org/PublicHealthEngland/canql.svg?branch=master)](https://travis-ci.org/PublicHealthEngland/canql)

Congenital Anomaly Natural Query Language (CANQL) is a [Treetop](http://treetop.rubyforge.org/) driven Domain Specific Language (DSL) used by the Public Health England (PHE) National Congenital Anomaly and Rare Disease Registration Service (NCARDRS) to identify cohorts of cases.

Used for analysis, research and day-to-day operations to empower non-technical users to write sophisticated human readable queries without the need to know or understand the underlying datastore and/or schema.

CANQL is decoupled from the specifics of the NCARDRS systems by producing an intermediate representation, known as Disease Intermediate Representation (DIR). This allows us to:

1. implement separate DIR adapters for different datastores (e.g. SQL and NoSQL datastores);
2. utilize the same DIR adapters for different but over-lapping DSLs, including Tumour Natural Query Language (TNQL) ; and
3. pass DIR queries to non-ruby backend systems using any simple format like JSON.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'canql'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install canql

## Usage

Here is a simple example showing a CANQL query of all male cases in south west registration region:

```ruby
require 'Canql'
require 'json'

query = 'all male south west cases'
parser = Canql::Parser.new(query)

if parser.valid?
  puts JSON.dump(parser.meta_data)
end
```

would output:

```json
{"patient.sex":{"equals":"1"},"patient.registry":{"equals":"84"}}
```

The parser is case insensitive. An example of an almost fully involved CANQL query is:

> First 27 male thames cases with prenatal anomalies and postnatal tests and missing postcode and date of birth and mother with fields postcode and nhs number

Please see the tests for many more examples.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/PublicHealthEngland/canql/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

