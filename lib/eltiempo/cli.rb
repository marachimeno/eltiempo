# frozen_string_literal: true

require_relative '../eltiempo'

require_relative 'errors/no_city_error'

module Eltiempo
  # CLI controller
  class CLI
    def call
      help_menu if ARGV.count.zero?
      case ARGV[0]
      when '-today'
        raise NoCityError if ARGV[1].nil?

        Eltiempo.today(ARGV[1])
      when '-av_min'
        raise NoCityError if ARGV[1].nil?

        Eltiempo.av_min(ARGV[1])
      when '-av_max'
        raise NoCityError if ARGV[1].nil?

        Eltiempo.av_max(ARGV[1])
      when '-h'
        help_menu
      end
    end

    def help_menu
      puts <<-DOC
      Welcome to eltiempo!
      Usage: eltiempo [option]
        -today city          get today's weather for a city
        -av_max city         get the average maximum temperature for the week in a city
        -av_min city         get the average minimum temperature for the week in a city

        NOTE: the city name can go without quotation marks
      DOC
    end
  end
end
