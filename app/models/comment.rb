class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

  #{コメントが空の場合は投稿できない。}
  validates :content, presence: true
end
