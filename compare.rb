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

class Compare
  attr_accessor :users
  def initialize(names)
    @users = names.map do |name|
      User.new(name)
    end
  end

  def placement
    @users = sort_by_points
    @users.each do |user|
      puts "#{user.hash["login"]} points:#{user.points}"
    end
    nil
  end

  def sort_by_points
    @users.sort do |user_1, user_2|
      user_2.points <=> user_1.points
    end
  end
end

# ARGV[0] ||= ''
# users = ARGV[0].split(",")
# compare = Compare.new(users)
