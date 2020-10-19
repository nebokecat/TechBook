class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def failure
        redirect_to root_path
    end

    def twitter
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user
          sign_in_and_redirect user, event: :authentication
          set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
        else
          if (data = request.env['omniauth.auth'])
            session['devise.omniauth_data'] = {
                email: data['info']['email'],
                provider: data['provider'],
                uid: data['uid']
            }
          end
          redirect_to new_user_registration_url
        end
    end
end