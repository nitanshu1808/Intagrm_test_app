# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV['INSTAGRAM_ID'],ENV['INSTAGRAM_SECRET'] 
end

OmniAuth.config.logger = Rails.logger