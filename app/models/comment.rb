# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  validates :content, presence: true
end
