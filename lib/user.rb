require_relative "data_retriever"

class User
  attr_accessor :hash, :points

  def initialize(name)
    @hash = {}
    @hash = DataRetriever.new(name).get_data
    @points = points_base
  end

  def points_base
    points = hash["public_repos"]
    points += hash["followers"]
    points += hash["public_gists"]
    points - @hash["id"].to_s.length
  end
end
