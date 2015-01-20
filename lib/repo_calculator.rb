require_relative "data_retriever"
require "pry"

class RepoCalculator
  attr_accessor :points
  attr_reader :hash

  def initialize(name)
    @points = 0
    @hash = DataRetriever.new(name,
                              url: "/repos",
                              filename: "#{name}_reops"
                             ).get_data
    calculate
  end

  private

  def calculate
    hash.each do |repo|
      self.points += repo["stargazers_count"]
      self.points += repo["watchers_count"]
      self.points += repo["forks_count"]
    end
  end
end
