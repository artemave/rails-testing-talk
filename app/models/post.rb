# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  validates :body, presence: true
  validates :title, presence: true
end
