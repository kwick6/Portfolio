require "minitest/spec"
require "minitest/autorun"

require "test_helper"

feature "CanAccessHome" do
  scenario "visit page and check text" do
    visit "http://localhost:3000/"
    page.text.must_include "My Portfolio"
  end
end
