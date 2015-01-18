require_relative "profile_calculator"
require_relative "repo_calculator"

class User
  attr_reader :name, :points

  def initialize(name)
    @name = name
    assign_points
  end

  private

  def assign_points
    @points = repo_points + profile_points
  end

  def repo_points
    RepoCalculator.new(name).points
  end

  def profile_points
    ProfileCalculator.new(name).points
  end
end
