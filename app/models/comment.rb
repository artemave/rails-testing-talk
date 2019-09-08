class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  def root
    root = commentable
    root = root.commentable while root.respond_to?(:commentable)
    root
  end
end
