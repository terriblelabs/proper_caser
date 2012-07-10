require "proper_caser/version"
require 'google-search'
require 'nokogiri'

module ProperCaser
  def self.best_guess(query)
    match_counts(query).first[0]
  end

  def self.match_counts(query)
    matches = Hash.new(0)

    # search google for the quoted query
    Google::Search::Web.new(query: %("#{query}")).each do |result|
      Nokogiri::HTML(result.content).xpath('//b').each do |match|
        # and increment the count for each match
        text = match.text
        matches[text] += 1 unless text == '...'
      end
    end

    Hash[matches.sort_by(&:last).reverse]
  end
end
