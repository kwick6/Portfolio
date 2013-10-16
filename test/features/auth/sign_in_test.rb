require "test_helper"

feature "As a user, I want to sign in to the app so that I can access my content." do
  scenario "a user signs in" do
    # Given an existing user
    visit root_path
    click_on "Sign in"

    # When the user creates a new session
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_button "Sign in"

    # Then the user should be signed in
    page.must_have_content "Signed in successfully."
    page.wont_have_content "Sign In"
  end
end
