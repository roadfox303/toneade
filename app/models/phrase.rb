# frozen_string_literal: true

class Phrase < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  has_many :tracks, dependent: :destroy
  accepts_nested_attributes_for :tracks, reject_if: :all_blank, allow_destroy: true
end
