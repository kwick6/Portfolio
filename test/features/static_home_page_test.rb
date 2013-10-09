require "minitest/spec"
require "minitest/autorun"

require "test_helper"

class StaticHomePageTest < Capybara::Rails::TestCase
  test "Check for text on page" do
    visit "http://localhost:3000/"
    page.text.must_include "My Portfolio"
  end
end
