class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    # Дёргаем метод модели, который найдёт пользователя
    @user = User.find_for_vkontakte_omniauth(request.env['omniauth.auth'])

    # Если юзер есть, то логиним и редиректим на его страницу
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'vkontakte')
      sign_in_and_redirect @user, event: :authentication
    # Если неудачно, то выдаём ошибку и редиректим на главную
    else
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: 'vkontakte',
        reason: 'authentication error'
      )

      redirect_to root_path
    end
  end
end