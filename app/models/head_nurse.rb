# frozen_string_literal: true

class HeadNurse < ApplicationRecord
  belongs_to :nurse
  has_many :nurses, dependent: :nullify
end
