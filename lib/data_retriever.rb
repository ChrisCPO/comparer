require_relative "config_vcr"
require "json"
require "net/http"
require "vcr"

class DataRetriever
  attr_reader :name
  def initialize(name)
    @name = name
    VcrConfig.new
  end

  def call_data
    VCR.use_cassette("github_#{name}") do
      Net::HTTP.get(URI("https://api.github.com/users/" + name))
    end
  end

  def get_data
    JSON.parse(call_data)
  end
end
