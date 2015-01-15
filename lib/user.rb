require 'net/http'
require 'json'

class User
  attr_accessor :hash, :points

  def initialize(name)
    @hash = {}
    uri = URI('https://api.github.com/users/'+ name)
    @hash = JSON.parse(Net::HTTP.get(uri))
    @points = points_base
  end

  def points_base
    points = hash["public_repos"]
    points += hash["followers"]
    points += hash["public_gists"]
    points -= @hash["id"].to_s.length
  end
end
