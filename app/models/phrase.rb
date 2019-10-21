class Phrase < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  has_many :tracks
end
