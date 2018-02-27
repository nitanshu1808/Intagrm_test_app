class FeedsController < ApplicationController
  def index
    if current_user
      begin
        response = RestClient.get ENV["INSTAGRAM_URL"] + ENV["MEDIA_URL"] + "?access_token=", {:params => { access_token:  current_user.oauth_token,max_id: params["max_id"], count: 9}}
        results  = JSON.parse(response)
        @max_id  = results["pagination"] && results["pagination"]["next_max_id"]
        @media   = results["data"]
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
