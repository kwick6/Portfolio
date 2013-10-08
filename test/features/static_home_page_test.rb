require "minitest/spec"
require "minitest/autorun"

require "test_helper"

class StaticHomePageTest < Capybara::Rails::TestCase
  test "sanity" do
    visit "http://localhost:3000/"
    page.text.must_include "My Portfolio"
  end
end
