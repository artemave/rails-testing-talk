require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get new" do
    get new_post_comment_url(@post)
    assert_response :success
  end

  test "should create comment" do
    assert_difference('@post.comments.count') do
      post post_comments_url(@post), params: { comment: { body: 'bananas' } }
    end

    assert_redirected_to post_url(@post)
  end
end
