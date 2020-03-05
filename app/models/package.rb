class Package < ApplicationRecord
  has_many :ownds, dependent: :destroy
end
