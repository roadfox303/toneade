# frozen_string_literal: true

class Nice < ApplicationRecord
  belongs_to :user
  belongs_to :blog
end
