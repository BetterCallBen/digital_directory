class Tag < ApplicationRecord
  has_many :agency_tags, dependent: :destroy
  has_many :agencies, through: :agency_tags

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :description, length: { maximum: 500 }

  scope :alphabetical, -> { order(:name) }
  scope :popular, -> { joins(:agencies).group("tags.id").order("COUNT(agencies.id) DESC") }

  def to_s
    name
  end
end
