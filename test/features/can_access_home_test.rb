require "minitest/spec"
require "minitest/autorun"

require "test_helper"

feature "CanAccessHome" do
  scenario "the test is sound" do
    visit "http://localhost:3000/"
    page.text.must_include "My Portfolio"
  end
  scenario "it works" do
    puts "The homepage is working"
  end
end
