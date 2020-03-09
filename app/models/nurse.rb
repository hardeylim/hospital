class Nurse < ApplicationRecord
  belongs_to :user
  has_many :nurse_patients, dependent: :destroy
  has_many :patients, through: :nurse_patients
end
