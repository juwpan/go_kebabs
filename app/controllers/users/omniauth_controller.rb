class Users::OmniauthController < Devise::OmniauthCallbacksController
  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      flash[:error] = I18n.t(
      'devise.omniauth_callbacks.failure',
      kind: 'Github',
      eason: 'authentication error'
      )

    redirect_to new_user_registration_url
    end
  end

  def vkontakte
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Vk') if is_navigational_format?
    else
      flash[:error] = I18n.t(
      'devise.omniauth_callbacks.failure',
      kind: 'Vkontakte',
      eason: 'authentication error'
      )

    redirect_to new_user_registration_url
    end
  end
    
  # def failure
  #   flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
  #   redirect_to new_user_registration_url
  # end
end