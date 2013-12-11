require 'rubygems'
require 'selenium-webdriver'
wd = Selenium::WebDriver.for :firefox

wd.get "http://saucelabs.com/test/guinea-pig"
wd.find_element(:id, "i am a link").click
if not wd.find_element(:id, "i_am_an_id").text == "I am another div"
    wd.close
    raise Exception, "assertText failed"
end
wd.quit
