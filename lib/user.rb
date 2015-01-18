require_relative "profile_calculator"
require_relative "repo_calculator"

class User
  attr_reader :name, :points, :repo_score, :profile_score

  def initialize(name)
    @name = name
    assign_points
  end

  private

  def assign_points
    @points = repo_points + profile_points
  end

  def repo_points
    @repo_score = RepoCalculator.new(name).points
  end

  def profile_points
    @profile_score = ProfileCalculator.new(name).points
  end
end
