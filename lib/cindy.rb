require "cindy/version"
require "cindy/client"
require "cindy/error"

module Cindy

  class << self

    def new(sendy_url, api_key = nil)
      # Alias method for Cindy::Client
      Cindy::Client.new(sendy_url, api_key)
    end

  end

end
