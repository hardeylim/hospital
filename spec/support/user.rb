# frozen_string_literal: true

def current_user
  return @user if @user.present?

  @user = User.create("name": 'NININ')
  @user.basic_password = 'password'
  @user.save
  session = @user.access_tokens.create
  @user.current_token = session.token
  @user
end

# def auth_get(url)
#   get(url, headers: { 'Authorization': current_user.current_token })
# end

# def auth_post(url, params)
#   post(url, params: params, headers: { 'Authorization': current_user.current_token })
# end

# def auth_patch(url, params)
#   patch(url, params: params, headers: { 'Authorization': current_user.current_token })
# end

# def auth_put(url, params)
#   put(url, params: params, headers: { 'Authorization': current_user.current_token })
# end

# def auth_delete(url, params)
#   delete(url, params: params, headers: { 'Authorization': current_user.current_token })
# end
