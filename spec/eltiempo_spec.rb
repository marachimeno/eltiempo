# frozen_string_literal: true

RSpec.describe Eltiempo do
  describe '#today' do
    context 'given a city name' do
      let(:city_name) { 'Barcelona' }
      it 'puts today\'s weather in given city' do
        expect { Eltiempo.today(city_name) }.to output("Weather today in #{city_name.capitalize}:
      - Maximum: #{Eltiempo.max_today(city_name)}°C
      - Minimum: #{Eltiempo.min_today(city_name)}°C\n").to_stdout
      end
    end
  end

  describe '#av_min' do
    context 'given a city name' do
      let(:city_name) { 'Barcelona' }
      it 'puts week\'s avergae minumum temperature in given city' do
        expect { Eltiempo.av_min(city_name) }.to output("#{city_name.capitalize}'s average minumum temperature for this week will be: #{Eltiempo.min_average(city_name)}°C\n").to_stdout
      end
    end
  end

  describe '#av_max' do
    context 'given a city name' do
      let(:city_name) { 'Barcelona' }
      it 'puts week\'s average maximum temperature in given city' do
        expect { Eltiempo.av_max(city_name) }.to output("#{city_name.capitalize}'s average maximum temperature for this week will be: #{Eltiempo.max_average(city_name)}°C\n").to_stdout
      end
    end
  end

  describe '#min_average' do
    context 'given a city name' do
      let(:city_name) { 'Barcelona' }
      it 'returns an integer' do
        expect(Eltiempo.min_average(city_name)).to be_kind_of(Integer)
      end
    end
  end

  describe '#max_average' do
    context 'given a city name' do
      let(:city_name) { 'Barcelona' }
      it 'returns an integer' do
        expect(Eltiempo.max_average(city_name)).to be_kind_of(Integer)
      end
    end
  end

  describe '#min_today' do
    context 'given a city name' do
      let(:city_name) { 'Barcelona' }
      it 'returns the first digit from week\'s min temperatures' do
        expect(Eltiempo.min_today(city_name)).to eq(EltiempoApi.week_mins(city_name).first)
      end
    end
  end

  describe '#max_today' do
    context 'given a city name' do
      let(:city_name) { 'Barcelona' }
      it 'returns the first digit from week\'s max temperatures' do
        expect(Eltiempo.max_today(city_name)).to eq(EltiempoApi.week_maxs(city_name).first)
      end
    end
  end
end
