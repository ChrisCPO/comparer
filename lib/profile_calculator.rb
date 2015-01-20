require_relative "data_retriever"
require_relative "time_calculator"
require "pry"

class ProfileCalculator
  attr_accessor :points
  attr_reader :hash

  ONE_COUNT = 1
  ZERO_COUNT = 0
  COMPLETE_PROFILE_COUNT = 5

  PROFILE_INFO = [["bio", points: 1],
                  ["blog", points: 3],
                  ["location", points: 1],
                  ["email", points: 2],
                  ["name", points: 1]
                 ]

  def initialize(name)
    @points = 0
    @hash = DataRetriever.new(name, filename: name).get_data
    base_points
    calculate
  end

  private

  def calculate
    count = 0
    PROFILE_INFO.each do |item|
      count += profile_item_is_complete?(item[0],item[1])
    end
    profile_is_complete?(count)
  end

  def base_points
    self.points += hash["public_repos"]
    self.points += hash["followers"]
    self.points += hash["public_gists"]
    self.points += TimeCalculator.new(hash).points
    self.points - hash["id"].to_s.length
  end

  def profile_is_complete?(count)
    if count == COMPLETE_PROFILE_COUNT
      self.points += 2
    end
  end

  def profile_item_is_complete?(string, hash)
    if hash[string] == nil || hash[string].to_s.length == 0
      ZERO_COUNT
    else
      self.points += hash[:points]
      ONE_COUNT
    end
  end
end
