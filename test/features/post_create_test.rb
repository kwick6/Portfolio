require "test_helper"

feature "creating a post" do
  scenario "works with valid data" do

    #clicks a button that says create new post
    visit posts_path
    click_on "New Post"
    fill_in 'Title', with: 'a new hope'
    fill_in 'Content', with: 'a long time ago far far away'

    # When I submit the form
    click_on 'Create Post'

    # Then I should see the post
    page.text.must_include 'a new hope'
    page.text.must_include 'a long time ago'

    # And a success message
    page.text.must_include 'Post was successfully created'


  end
end
