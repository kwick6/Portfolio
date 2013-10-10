require "test_helper"

feature "deleting a post" do
  scenario "removes a post upon delete" do

   visit posts_path

   # When the delete link is clicked
   page.find("tr#post_#{posts(:cr).id}").click_on "Destroy"

   # Then the post is deleted
   page.wont_have_content "Code Rails"
   page.must_have_content "Becoming a Code Fellow"

  end
end
