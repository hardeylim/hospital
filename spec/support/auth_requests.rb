# frozen_string_literal: true

%i[get patch put post delete].each do |method|
  
  define_method "auth_#{method}" do |path, params = {}|
    send(method, path, params: params, headers: { Authorization: current_user.current_token })
  end

end
