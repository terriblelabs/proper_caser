require "proper_caser/version"
require 'google-search'
require 'nokogiri'

module ProperCaser
  def self.best_guess(query)
    capitalization_counts(query).first[0]
  end

  def self.capitalization_counts(query)
    regexp = Regexp.new(query, 'i')

    matches = Hash.new(0)

    # search google for the quoted query
    Google::Search::Web.new(query: %("#{query}")).each do |result|
      text = Nokogiri::HTML(result.content).content.gsub(/\s+/, ' ')

      # match the content against our query regexp
      text.scan(regexp).each do |match|
        # and increment the count for each match
        matches[match] += 1
      end
    end

    Hash[ matches.sort_by(&:last).reverse ]
  end
end
