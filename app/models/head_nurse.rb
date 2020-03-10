class HeadNurse < ApplicationRecord
  belongs_to :user
  has_many :nurses
  #
  # a = HeadNurse.frirst
  # a.nurse.user
  #
end
