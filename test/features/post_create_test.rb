require "test_helper"

feature "creating a post" do
  scenario "works with valid data" do

    #clicks a button that says create new post
    visit posts_path
    click_on "New Post"
    fill_in 'Title', with: posts(:cr).title
    fill_in 'Content', with: posts(:cr).content

    # When I submit the form
    click_on 'Create Post'

    # Then I should see the post
    page.text.must_include posts(:cr).title

    # And a success message
    page.text.must_include 'Post was successfully created'


  end
end