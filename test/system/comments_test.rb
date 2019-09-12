# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'commenting on a post' do
    visit post_path(@post)

    fill_in 'comment_body', with: 'bananas'
    click_on 'Create Comment'

    assert_text 'Comment was successfully created'
    assert_text 'bananas'
  end

  test 'replying to a comment' do
    visit post_path(@post)
    click_on 'reply'
    fill_in 'comment_body', with: 'apples'
    click_on 'Create Comment'

    assert_text 'Comment was successfully created'
    assert_text 'apples'
  end
end
