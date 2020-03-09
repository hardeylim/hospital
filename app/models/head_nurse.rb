class HeadNurse < ApplicationRecord
  belongs_to :user
  belongs_to :nurse
end
