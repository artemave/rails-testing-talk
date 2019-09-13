# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  validates :body, presence: true

  default_scope -> { order created_at: :desc }

  def root
    root = commentable
    root = root.commentable while root.respond_to?(:commentable)
    root
  end

  def top_level?
    commentable.is_a?(Post)
  end
end
