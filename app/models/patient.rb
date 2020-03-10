# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :user
  # has_many :nurse_patients
  # has_many :nurse, through: :nurse_patients
  #
  #
  has_one :nurse_patient
  has_one :nurse, through: :nurse_patient
end
