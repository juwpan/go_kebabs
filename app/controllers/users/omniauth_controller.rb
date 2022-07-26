class Users::OmniauthController < Devise::OmniauthCallbacksController
  def github
    omniauth('Github')
  end

  def mail_ru
    omniauth('Mail')
  end

  def google_oauth2
    omniauth('Google')
  end

  private

  def omniauth(kind)
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      @user.skip_confirmation!
      sign_in_and_redirect @user

      set_flash_message(:notice, :success, kind: kind) if is_navigational_format?
    else
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: kind,
        reason: 'authentication error'
      )

      redirect_to new_user_registration_url
    end
  end
end
