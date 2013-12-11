require 'rubygems'
require "test/unit"
require 'selenium-webdriver'

class ExampleTest < Test::Unit::TestCase
    def setup
        caps = Selenium::WebDriver::Remote::Capabilities.firefox
        caps.version = "5"
        caps.platform = :XP
        caps[:name] = "Testing Selenium 2 with Ruby on Sauce"

        @driver = Selenium::WebDriver.for(
          :remote,
          :url => "http://scottg123:47f807ce-480f-46e3-9b43-d5b15177f8a4@ondemand.saucelabs.com:80/wd/hub",
          :desired_capabilities => caps)
    end

    def test_sauce
        @driver.navigate.to "http://saucelabs.com/test/guinea-pig"
        assert @driver.title.include?("I am a page title - Sauce Labs")
    end

    def teardown
        @driver.quit
    end
end
