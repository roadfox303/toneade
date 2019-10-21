class Phrase < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  has_many :tracks
  # accepts_nested_attributes_for :tracks, reject_if: :all_blank, allow_destroy: true
end
