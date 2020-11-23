# frozen_string_literal: true

require_relative './eltiempo/version'
require_relative './eltiempo/eltiempo_api'
require_relative './eltiempo/errors/no_city_error'

module Eltiempo
  # CLI controller
  class CLI
    def today(city_name)
      max = max_today(city_name)
      min = min_today(city_name)
      puts "Weather today in #{city_name.capitalize}:
        - Maximum: #{max}°C
        - Minimum: #{min}°C"
    end

    def av_min(city_name)
      temperature = min_average(city_name)
      puts "#{city_name.capitalize}'s average minumum temperature for this week will be: #{temperature}°C"
    end

    def av_max(city_name)
      temperature = max_average(city_name)
      puts "#{city_name.capitalize}'s average maximum temperature for this week will be: #{temperature}°C"
    end

    def min_average(city_name)
      all_mins = EltiempoApi.week_mins(city_name)
      all_mins = all_mins.map(&:to_i)
      all_mins.sum / 7
    end

    def max_average(city_name)
      all_maxs = EltiempoApi.week_maxs(city_name)
      all_maxs = all_maxs.map(&:to_i)
      all_maxs.sum / 7
    end

    def min_today(city_name)
      EltiempoApi.week_mins(city_name).first
    end

    def max_today(city_name)
      EltiempoApi.week_maxs(city_name).first
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
