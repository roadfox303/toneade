class Package < ApplicationRecord
  has_many :ownds, dependent: :destroy
  validates :product_id, presence: true
  validates :name, presence: true
end
