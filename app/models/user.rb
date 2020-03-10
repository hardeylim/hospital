class User < ApplicationRecord
  has_many :nurses
  has_many :patients

end
