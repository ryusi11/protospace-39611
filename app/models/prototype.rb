class Prototype < ApplicationRecord
  has_one_attached :image

  # validates :image, presence: true, unless: :was_attached?

  # def was_attached?
  #   title.present? && catch_copy.present? && concept.present?
  # end

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true

  has_many :comments
  belongs_to :user

end
