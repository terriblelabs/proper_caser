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

  describe '#match_counts' do
    it 'returns a hash of possible capitalizations and their counts' do
      VCR.use_cassette('ios') do
        ProperCaser.match_counts('IOS').should == {
          "iOS" => 54,
          "Ios" => 19,
          "IOS" => 10,
          "ios" => 3
        }
      end

      VCR.use_cassette('IAMA') do
        ProperCaser.match_counts('IAMA').should == {
          "IAMA"     => 34,
          "IAmA"     => 9,
          "Iama's"   => 2,
          "IAMA's"   => 2,
          "I.A.M.A." => 2,
          "iama"     => 1
        }
      end
    end
  end
end
