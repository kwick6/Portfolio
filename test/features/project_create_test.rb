require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "Code Fellows Website"
    fill_in "Details", with: "Ruby on Rails"
    click_on "Create Project"
    page.text.must_have "Code Fellows Website"
    page.text.must_have "Ruby"
  end
end
