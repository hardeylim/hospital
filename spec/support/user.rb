# frozen_string_literal: true

def current_user
  return @user if @user.present?

  @user ||= User.create("name": 'NININ')
  @user.basic_password = 'password'
  @user.save
  sessions = @user.access_tokens.create
  @user
end
