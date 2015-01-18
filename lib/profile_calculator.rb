require_relative "data_retriever"
require "pry"

class ProfileCalculator
  attr_accessor :points
  attr_reader :hash

  ONE_COUNT = 1
  ZERO_COUNT = 0
  COMPLETE_PROFILE_COUNT = 5

  def initialize(name)
    @points = 0
    @hash = DataRetriever.new(name, filename: name).get_data
    base_points
    calculate
  end

  private

  def calculate
    count = 0
    count += profile_item_is_complete?("bio", points: 1)
    count += profile_item_is_complete?("blog", points: 3)
    count += profile_item_is_complete?("location", points: 1)
    count += profile_item_is_complete?("email", points: 2)
    count += profile_item_is_complete?("name", points: 1)
    profile_is_complete?(count)
  end

  def base_points
    @points += hash["public_repos"]
    @points += hash["followers"]
    @points += hash["public_gists"]
    @points - hash["id"].to_s.length
  end

  def profile_is_complete?(count)
    if count == COMPLETE_PROFILE_COUNT
      @points += 2
    end
  end

  def profile_item_is_complete?(string, hash)
    if hash[string] == nil || hash[string].to_s.length == 0
      ZERO_COUNT
    else
      @points += hash[:points]
      ONE_COUNT
    end
  end

  def empty_string
    ""
  end
end
