# frozen_string_literal: true

# Error for when city is not passed as an argument
class NoCityError < StandardError
  def initialize(msg = 'You need to enter a city name')
    super
  end
end
