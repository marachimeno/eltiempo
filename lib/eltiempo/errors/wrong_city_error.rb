# frozen_string_literal: true

# Error for when city is invalid (outside Barcelona region or has syntax errors)
class WrongCityError < StandardError
  def initialize(msg = 'You have entered an invalid city. Make sure that they city is within Barcelona or check the syntax and try again.')
    super
  end
end
