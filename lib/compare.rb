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
      puts "#{user.name} total points:#{user.points}"
      puts "---- profile score: #{user.profile_score}"
      puts "---- repo    score: #{user.repo_score}"
    end
    nil
  end

  def sort_by_points
    users.sort_by(&:points).reverse
  end
end

ARGV[0] ||= ""
users = ARGV[0].split(",")
compare = Compare.new(users)
compare.placement
