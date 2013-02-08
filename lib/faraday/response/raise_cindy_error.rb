require 'faraday'
require 'cindy/error'

module Faraday
  class Response::RaiseCindyError < Response::Middleware

    def on_complete(response)
      case response[:body]
      when /No data passed/i
      when /Already subscribed./i
        raise ::Cindy::AlreadySubscribed
      when /Invalid email address./i
        raise ::Cindy::InvalidEmailAddress
      end

      # key = response[:status].to_i
      # raise ERROR_MAP[key].new(response) if ERROR_MAP.has_key? key
    end

  end
end
