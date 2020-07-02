# frozen_string_literal: true

require 'appium_lib'
require 'appium_console'
require 'cucumber'
require 'pry-nav'
require 'rspec'
require 'selenium-webdriver'
require 'faker'

$wait = Selenium::WebDriver::Wait.new(timeout: 90)

def load_appium_configuration(platform)
  dir = "#{Dir.pwd}/config/#{platform}/appium.txt"
  Appium.load_appium_txt file: File.expand_path(dir, __FILE__), verbose: true
end

env = ENV['PLATFORM_NAME'].downcase
USUARIOS = YAML.load_file(File.dirname(__FILE__) + "/massas/massa.yml")

case env
when 'android'
  caps = load_appium_configuration(env)
  caps[:appium_lib][:export_session] = true
when 'ios'
  caps = load_appium_configuration(env)
  caps[:appium_lib][:export_session] = true
else
  raise("Platform not supported #{ENV['PLATFORM_NAME']}")
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
