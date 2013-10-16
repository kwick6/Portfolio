require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    # Given new project data entered in a form
    visit projects_path
    click_on "New Project"
    sign_in_user
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Details", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"

    # When the form is submitted
    click_on "Create Project"

    # Then a confirmation page should show the new Project
    page.text.must_include "Project was successfully created."
    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails"
  end

end
