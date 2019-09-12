# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  test 'creating a Post' do
    visit posts_url
    click_on 'New Post'

    fill_in 'Body', with: 'hello'
    fill_in 'Title', with: 'bananas'
    click_on 'Create Post'

    assert_text 'Post was successfully created'
    assert_text 'hello'
    assert_text 'bananas'
  end
end
