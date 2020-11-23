class WrongOptionError < StandardError
  def initialize(msg = 'The option you have passed is not valid. Run "-h" to see all available options.')
    super
  end
end
