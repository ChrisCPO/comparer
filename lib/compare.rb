require_relative "comparer"

class Compare
  attr_accessor :users
  def initialize(names)
    @users = names.map do |name|
      User.new(name)
    end
  end

  def placement
    @users = sort_by_points
    users.each do |user|
      puts "#{user.hash["login"]} points:#{user.points}"
    end
    nil
  end

  def sort_by_points
    users.sort do |user_1, user_2|
      user_2.points <=> user_1.points
    end
  end
end

ARGV[0] ||= ""
users = ARGV[0].split(",")
compare = Compare.new(users)
compare.placement
