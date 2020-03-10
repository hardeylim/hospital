class HeadNurse < ApplicationRecord
  belongs_to :nurse
  has_many :nurses
end
