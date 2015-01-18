require_relative "config_vcr"
require "json"
require "net/http"
require "vcr"

class DataRetriever
  attr_reader :name, :filename, :url

  def initialize(name, options)
    @filename = options[:filename] ||= name
    @url = options[:url] ||= ""
    @name = name
    VcrConfig.new
  end

  def call_data
    VCR.use_cassette("github_#{filename}") do
      Net::HTTP.get(URI("https://api.github.com/users/" + name + url))
    end
  end

  def get_data
    JSON.parse(call_data)
  end
end
