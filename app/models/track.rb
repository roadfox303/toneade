# frozen_string_literal: true

class Track < ApplicationRecord
  belongs_to :phrase
  validates :name, length: { maximum: 24 }
end
