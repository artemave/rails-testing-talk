# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'commenting on a post' do
    visit post_path(@post)

    fill_in 'comment_body', with: 'bananas'
    click_on 'Add Comment'

    assert_text 'bananas'
  end

  test 'replying to a comment' do
    visit post_path(@post)

    click_on 'reply'

    within ':not([data-controller=new-comment]) form' do
      fill_in 'comment_body', with: 'apples'
      click_on 'Add Comment'
    end

    assert_text 'apples'
  end

  test 'submitting invalid post comment' do
    visit post_path(@post)
    click_on 'Add Comment'

    assert_text "Body can't be blank"
  end

  test 'submitting invalid reply' do
    visit post_path(@post)

    click_on 'reply'

    within ':not([data-controller=new-comment]) form' do
      click_on 'Add Comment'
    end

    assert_text "Body can't be blank"
  end
end
