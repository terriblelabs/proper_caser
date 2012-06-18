require 'spec_helper'
require File.expand_path('lib/proper_caser')

describe ProperCaser do
  describe '#best_guess' do
    it 'returns the match with the highest number of results' do
      VCR.use_cassette('ios') do
        ProperCaser.best_guess('IOS').should == 'iOS'
      end

      VCR.use_cassette('IAMA') do
        ProperCaser.best_guess('IAMA').should == 'IAMA'
      end
    end
  end

  describe '#capitalization_counts' do
    it 'returns a hash of possible capitalizations and their counts' do
      VCR.use_cassette('ios') do
        ProperCaser.capitalization_counts('IOS').should == {
          "iOS" => 54,
          "Ios" => 19,
          "IOS" => 10,
          "ios" => 10
        }
      end

      VCR.use_cassette('IAMA') do
        ProperCaser.capitalization_counts('IAMA').should == {
          "IAMA" => 38,
          "IAmA" => 9,
          "iama" => 2,
          "Iama" => 2
        }
      end
    end
  end
end
