# Eltiempo

Welcome to your new CLI! In this CLI you can check the weather of all cities withing Barcelona's region. You can check
the average minimum temperature for the week in a city, the average maximum temperature for the week in a city and
today's temperature in a city (the maximum and minimum).


## Usage
Download or clone this repo into you computer and navigate to the root directory `eltiempo`.
From there you can run the following commands:
```
eltiempo OPTIONS   NAME OF CITY
eltiempo -h                            #get help menu to see all option
eltiempo -today    Barcelona           #get today's weather for a city
eltiempo -av_max   Barcelona           #get the average maximum temperature for the week in a city
eltiempo -av_min   Barcelona           #get the average minimum temperature for the week in a city

NOTE: the city name can go without quotation marks
```
You will need to add your affiliate id for Eltiempo API to work.

## Build status
Build status from **Travis** (Continus Integration)
[![Build Status](https://travis-ci.com/marachimeno/eltiempo.svg?branch=master)](https://travis-ci.org/marachimeno/eltiempo)

## Tech/Framework
This CLI was built using:
- **[Ruby 2.6.6](https://www.ruby-lang.org/en/)**

## Tests
Used **[rspec-rails](https://github.com/rspec/rspec-rails)** for testing.
In order to run the test just type the following command in the terminal:
```
rspec
```

## Code style
Currently using **[Rubocop](https://github.com/rubocop-hq/rubocop/blob/master/README.md)** for code formatting and code analysis (linter).
In order to use it:
- run the following command to see in which files there are style offenses:
```
rubocop
```
- run the following command to autocorrect style offenses:
```
rubocop -A
```
