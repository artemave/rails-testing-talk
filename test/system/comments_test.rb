require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "creating a Comment" do
    visit post_path(@post)

    click_on "New Comment"

    fill_in "Body", with: 'bananas'
    click_on "Create Comment"

    assert_text "Comment was successfully created"
    assert_equal(@post.reload.comments.last.body, 'bananas')
  end
end
