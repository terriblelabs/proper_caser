# ProperCaser

ProperCaser is a gem to help you clean up poorly capitalized data by leveraging google web search.  Here's a quick example:

    > ProperCaser.best_guess('john mccain')
    => "John McCain"

ProperCaser does not work with versions of ruby < 1.9 and neither should you.

## Installation

Add this line to your application's Gemfile:

    gem 'proper_caser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install proper_caser

## Usage

ProperCaser currently only exposes two methods:

`best_guess` will return a single string that is the most commonly matched result from the search.

    > ProperCaser.best_guess('IOS')
    => "iOS"

`match_counts` will return a hash (ordered by descending number of matches in ruby 1.9) with the match and the number of results.

    > ProperCaser.match_counts('IOS')
    => {"iOS"=>53, "Ios"=>18, "IOS"=>15, "ios"=>7}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
