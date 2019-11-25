class Blog < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_one :phrase, dependent: :destroy
  accepts_nested_attributes_for :phrase, reject_if: :all_blank, allow_destroy: true
  has_many :nices, dependent: :destroy
  has_many :nice_users, through: :nices, source: :user
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user
end
