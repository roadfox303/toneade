class Blog < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_one :phrase, dependent: :destroy
  # accepts_nested_attributes_for :phrase, reject_if: :all_blank, allow_destroy: true

end
