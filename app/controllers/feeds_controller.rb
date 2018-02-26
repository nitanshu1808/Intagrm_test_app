class FeedsController < ApplicationController
  def index
    if current_user
      begin
        # response = RestClient.get "https://api.instagram.com/v1/users/self/?access_token=", {:params => { access_token:  current_user.oauth_token}}
        response = RestClient.get ENV["INSTAGRAM_URL"] + ENV["MEDIA_URL"] + "?access_token=", {:params => { access_token:  current_user.oauth_token}}
        @results = JSON.parse(response)
        @media   = @results["data"]
      rescue RestClient::BadRequest => error
        retries ||= 0
        if retries == 0
          retries = 1
          retry
        else
          raise error
        end
      end
    end
  end
end
