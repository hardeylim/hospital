# frozen_string_literal: true

class HeadNurse < ApplicationRecord
  belongs_to :nurse
  has_many :nurses, dependent: :nullify

  validate :check_nurse_existence

  def check_nurse_existence
    errors.add(:base, "Nurse does not exists") unless Nurse.where(id: self.nurse_id).present?
  end

end
