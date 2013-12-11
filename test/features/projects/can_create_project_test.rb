require "test_helper"

feature "CanCreateProject" do
  scenario "it should show a new project form", js: true do
    sign_in_user
    visit '/projects'
    click_link "New Project"

    page.text.must_include("Name")
  end
end
