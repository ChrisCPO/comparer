require_relative "data_retriever"
require_relative "profile_calculator"

class User
  attr_accessor :hash, :points

  def initialize(name)
    @hash = {}
    @hash = DataRetriever.new(name).get_data
    assign_points
  end

  def assign_points
    points_calc = ProfileCalculator.new(hash)
    @points = points_base + points_calc.points
  end

  def points_base
    points = hash["public_repos"]
    points += hash["followers"]
    points += hash["public_gists"]
    points - @hash["id"].to_s.length
  end
end
