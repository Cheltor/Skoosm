class Post < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :ptype
  validates_format_of :url, :with => /\A^https?+.{1,}\z/i, :allow_blank => true
  has_many :comments, as: :commentable
end
