class TimeCalculator
  attr_reader :hash, :points

  POINTS_PER_YEAR = 5

  def initialize(hash)
    @points = 0
    @hash = hash
    calculate
  end

  def calculate
    created_year = Time.parse(hash["created_at"]).year
    current_year = Time.new.year
    @points = (current_year - created_year) * POINTS_PER_YEAR
  end
end
