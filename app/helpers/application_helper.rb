module ApplicationHelper
  def fetch_image_url(media)
    media && media["images"] && media["images"]["standard_resolution"] && media["images"]["standard_resolution"]["url"]
  end

  def fetch_caption(media)
    media && media["caption"] && media["caption"]["text"]
  end
end
