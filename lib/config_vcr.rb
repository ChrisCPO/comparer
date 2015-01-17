require "vcr"
require "webmock"

class VcrConfig
  def initialize
    VCR.configure do |config|
      config.cassette_library_dir = "fixtures/vcr_cassettes"
      config.hook_into :webmock
    end
  end
end
