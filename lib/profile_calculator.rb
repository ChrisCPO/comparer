require "pry"

class ProfileCalculator
  attr_reader :hash, :points

  ONE_COUNT = 1
  ZERO_COUNT = 0
  COMPLETE_PROFILE_COUNT = 5

  def initialize(hash)
    @points = 0
    @hash = hash
    calculate
  end

  def calculate
    count = 0
    count += profile_item_is_complete?("bio", points: 1)
    count += profile_item_is_complete?("blog", points: 3)
    count += profile_item_is_complete?("location", points: 1)
    count += profile_item_is_complete?("email", points: 2)
    count += profile_item_is_complete?("name", points: 1)
    profile_is_complete?(count)
  end

  private

  def profile_is_complete?(count)
    if count = COMPLETE_PROFILE_COUNT
      @points += 2
    end
  end

  def profile_item_is_complete?(string, hash)
    if hash[string] != nil || empty_string
      @points += hash[:points]
      ONE_COUNT
    else
      ZERO_COUNT
    end
  end

  def empty_string
    ""
  end
end
