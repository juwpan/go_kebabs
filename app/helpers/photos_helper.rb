module PhotosHelper
  def photo_variant(photo)
    if photo.photo.attached?
      photo.photo.variant(:thumb)
    else
      asset_path('event_thumb.jpg')
    end
  end

  def photo_gallery(photo)
    if photo.photo.attached?
      url_for(photo.photo)
    else
      asset_path('event.jpg')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('event.jpg')
    end
  end

  def event_thumb(event)
    if event.nil?
      asset_path('event_thumb.jpg')
    else
      event.photos.first.photo
    end
  end
end
