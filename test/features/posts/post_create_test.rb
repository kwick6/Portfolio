require "test_helper"

feature "creating a post" do
  scenario "works with valid data" do

    #Given a signed in user

    sign_in_user

    click_link 'Blog'
    click_link 'New Post'

    #Create a new post

    #fill_in 'Title', with: posts(:cr).title
    fill_in 'Content', with: posts(:cr).content

    # When I submit the form
    click_on 'Create Post'

    # Then I should see the post
    page.text.must_include posts(:cr).content

    # And a success message
    page.text.must_include 'Post was successfully created'


  end
end
