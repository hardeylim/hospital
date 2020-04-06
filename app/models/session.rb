class Session < ApplicationRecord

  belongs_to :user

  before_create :generate_secure_token

  validates :token, presence: true

  private

  def generate_secure_token
    self.token =  SecureRandom.urlsafe_base64(64).tr('lIO0', 'sxyz')
  end

end
