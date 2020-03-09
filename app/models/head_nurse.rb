class HeadNurse < ApplicationRecord
  belongs_to :user
  has_many :nurses
end
