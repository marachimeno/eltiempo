# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'dotenv'

require_relative 'errors/wrong_city_error'

Dotenv.load

# Fetch information from eltiempo API
module EltiempoApi
  BASE_URL = 'http://api.tiempo.com/index.php?api_lang=es&division=102'
  AFFILIATE_ID = "&affiliate_id=#{ENV['AFFILIATE_ID']}"

  def self.xml(url)
    Nokogiri::HTML(URI.parse(url).open)
  end

  def self.city_url(city_name)
    xml = xml(BASE_URL + AFFILIATE_ID)
    url = ''

    xml.xpath('//location//data//name').each_with_index do |name, index|
      url += xml.xpath('//location//data//url')[index].content if name.content.downcase == city_name&.downcase
    end
    raise WrongCityError if url == ''

    url
  end

  def self.week_mins(city_name)
    url = city_url(city_name)
    xml = xml(url + AFFILIATE_ID)
    min = xml.css('location var').first
    min.css('data forecast').map { |d| d.values.last }
  end

  def self.week_maxs(city_name)
    url = city_url(city_name)
    xml = xml(url + AFFILIATE_ID)
    max = xml.css('location var')[1]
    max.css('data forecast').map { |d| d.values.last }
  end
end
