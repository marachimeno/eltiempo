# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe EltiempoApi do
  describe '#xml' do
    context 'given a valid affiliate id' do
      it 'returns an xml' do
        doc = EltiempoApi.xml("http://api.tiempo.com/index.php?api_lang=es&division=102&affiliate_id=#{ENV['AFFILIATE_ID']}")
        expect(doc.xpath('//location//data//name').first.content).to eq('Abrera')

        doc = EltiempoApi.xml("http://api.tiempo.com/index.php?api_lang=es&localidad=79254&affiliate_id=#{ENV['AFFILIATE_ID']}")
        expect(doc.css('report location name').first.text).to eq('Temperatura Mínima')
      end
    end

    context 'given an invalid affiliate id' do
      it 'returns an xml with error message' do
        doc = EltiempoApi.xml('http://api.tiempo.com/index.php?api_lang=es&division=102&affiliate_id=dc25x8thoop2')
        expect(doc.content).to eq('Usted no está registrado como usuario de la API de tiempo.com o su cuenta no está activada.')

        doc = EltiempoApi.xml('http://api.tiempo.com/index.php?api_lang=es&localidad=79254&affiliate_id=dc25x8thoop2')
        expect(doc.content).to eq('Usted no está registrado como usuario de la API de tiempo.com o su cuenta no está activada.')
      end
    end

    context 'not passing "&affiliate_id" parameter' do
      it 'redirects the user to log-in/register page' do
        doc = EltiempoApi.xml('http://api.tiempo.com/index.php?api_lang=es&division=102')
        expect(doc.xpath('html//head//title').text).to eq('API Tiempo. Librería de Predicciones meteorológicas - Meteored')

        doc = EltiempoApi.xml('http://api.tiempo.com/index.php?api_lang=es&localidad=79254')
        expect(doc.xpath('html//head//title').text).to eq('API Tiempo. Librería de Predicciones meteorológicas - Meteored')
      end
    end
  end

  describe '#city_url' do
    context 'given a valid city name' do
      let(:city_name) { 'Alella' }
      it 'returns the url from a city in Barcelona region' do
        expect(EltiempoApi.city_url(city_name)).to eq('http://api.tiempo.com/index.php?api_lang=es&localidad=1184')
      end
    end

    context 'given an invalid city name' do
      let(:city_name) { 'Madrid' }
      let(:city_name) { 'erfewrqwf' }

      it 'returns an error message to check syntax' do
        expect { EltiempoApi.city_url(city_name) }.to raise_error(WrongCityError)
      end
    end
  end

  describe '#week_mins' do
    context 'given a valid city name' do
      let(:city_name) { 'Alella' }
      it 'returns an array with 7 digits' do
        expect(EltiempoApi.week_mins(city_name).count).to eq(7)
      end
    end
  end

  describe '#week_maxs' do
    context 'given a valid city name' do
      let(:city_name) { 'Alella' }
      it 'returns an array with 7 digits' do
        expect(EltiempoApi.week_maxs(city_name).count).to eq(7)
      end
    end
  end
end
