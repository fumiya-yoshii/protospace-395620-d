class Prototype < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true, unless: :was_attached?
  validates :catch_copy, presence: true, unless: :was_attached?
  validates :concept, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
