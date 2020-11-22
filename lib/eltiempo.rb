# frozen_string_literal: true

require_relative './eltiempo/version'
require_relative './eltiempo/cli'
require_relative './eltiempo/eltiempo_api'

module Eltiempo
  class Error < StandardError; end

  def self.today(city_name)
    max = max_today(city_name)
    min = min_today(city_name)
    puts "Weather today in #{city_name.capitalize}:
      - Maximum: #{max}°C
      - Minimum: #{min}°C"
  end

  def self.av_min(city_name)
    temperature = min_average(city_name)
    puts "#{city_name.capitalize}'s average minumum temperature for this week will be: #{temperature}°C"
  end

  def self.av_max(city_name)
    temperature = max_average(city_name)
    puts "#{city_name.capitalize}'s average maximum temperature for this week will be: #{temperature}°C"
  end

  def self.min_average(city_name)
    all_mins = EltiempoApi.week_mins(city_name)
    all_mins = all_mins.map(&:to_i)
    all_mins.sum / 7
  end

  def self.max_average(city_name)
    all_maxs = EltiempoApi.week_maxs(city_name)
    all_maxs = all_maxs.map(&:to_i)
    all_maxs.sum / 7
  end

  def self.min_today(city_name)
    EltiempoApi.week_mins(city_name).first
  end

  def self.max_today(city_name)
    EltiempoApi.week_maxs(city_name).first
  end
end
