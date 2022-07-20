module ApplicationHelper
  def user_avatar(user)
    if user.avatar.attached?
      user.avatar.variant(:thumb)
    else
      user.gravatar_url
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.attached?
      user.avatar.variant(:thumb)
    else
      user.gravatar_url
    end
  end

  def user_noname(user)
    asset_path('noname.png')
  end


  def fa_icon(icon_class)
    content_tag 'span', '', class: "bi bi-#{icon_class} btn-outline-dark"
  end

  def resources_name
    :user
  end

  def resources
    @resources ||= User.new
  end

  def resources_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mapping[:user]
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-success"
        when :error then "alert alert-danger"
        when :alert then "alert alert-danger"
    end
  end
end
