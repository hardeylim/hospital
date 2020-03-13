
class AccessToken < ApplicationRecord
  belongs_to :user

  before_create :set_token

  def set_token
    self.token = SecureRandom.urlsafe_base64(32).tr('lIO0', 'sxyz')
  end

end
