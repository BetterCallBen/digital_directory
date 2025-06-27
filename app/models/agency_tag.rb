class AgencyTag < ApplicationRecord
  belongs_to :agency
  belongs_to :tag

  validates :agency_id, uniqueness: { scope: :tag_id }
end
