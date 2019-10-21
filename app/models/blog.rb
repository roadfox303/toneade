class Blog < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_one :phrase, dependent: :destroy
  has_many :tracks, through: :phrase
  has_many :phrase_track, through: :phrase, source: :track


  # has_many :labels, dependent: :destroy
  # has_many :tags, through: :labels
  # has_many :label_tag, through: :labels, source: :tag
end
