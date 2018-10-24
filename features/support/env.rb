require 'capybara'
require 'capybara/DSL'
require 'capybara/RSPEC/MATCHERS'
require 'capybara/rspec'
require "selenium-webdriver"
require 'capybara/poltergeist'
require "site_prism"
require "report_builder"
require_relative "pages_helpers.rb"
require_relative "helpers.rb"


World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(PageObjects)
World(Helpers)


$BROWSER = ENV["BROWSER"]
CONFIG = YAML.load_file("cucumber.yml")
AMBIENTE = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{CONFIG["ambiente"]}.yml")


Capybara.register_driver :selenium do |app|
  if $BROWSER.eql? "firefox" or $BROWSER.nil?
    $BROWSER_DEFAULT = "firefox"
    Capybara::Selenium::Driver.new(app, :browser => :firefox)

  elsif $BROWSER.eql? "chrome"
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = AMBIENTE["url"]
  config.default_max_wait_time = 5
end
