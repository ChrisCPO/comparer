require_relative "data_retriever"
require "pry"

class RepoCalculator
  attr_reader :points, :hash

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
      @points += repo["stargazers_count"]
      @points += repo["watchers_count"]
      @points += repo["forks_count"]
    end
  end
end
