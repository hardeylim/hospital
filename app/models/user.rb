# frozen_string_literal: true

class User < ApplicationRecord
  has_many :nurses
  has_many :patients

  validates :name, presence: true

end
