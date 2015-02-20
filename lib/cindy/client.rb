require 'faraday'
require 'faraday_middleware'
require 'faraday/response/raise_cindy_error'

module Cindy
  class Client

    def initialize(sendy_url, api_key = nil)
      @url = sendy_url
      @key = api_key || ENV['SENDY_API_KEY']
    end

    def create_campaign(opts={})
      post_opts     = {}
      req_opts      = %i(from_name from_email reply_to subject html_text)
      optional_opts = %i(plain_text list_ids brand_id send_campaign)

      req_opts.each do |opt|
        post_opts[opt] = opts.delete(opt) || raise(ArgumentError, "opt :#{opt} required")
      end
      post_opts.merge!(Hash[optional_opts.zip(opts.values_at(*optional_opts))])

      response = connection.post "api/campaigns/create.php" do |req|
        req.body = post_opts
      end

      response.body
    end

    def subscribe(list_id, email, name = nil)
      response = connection.post "subscribe" do |req|
        params = {list: list_id, email: email, boolean: true}
        params[:name] = name if name
        req.body = params
      end

      !!(response.body =~ /^1$/)
    end

    def unsubscribe(list_id, email)
      response = connection.post "unsubscribe", {list: list_id, email: email, boolean: true}

      !!(response.body =~ /^1$/)
    end

    def subscription_status(list_id, email)
      response = connection.post "api/subscribers/subscription-status.php" do |req|
        req.body = {list_id: list_id, email: email, api_key: @key}
      end

      response.body
    end

    def active_subscriber_count(list_id)
      response = connection.post "api/subscribers/active-subscriber-count.php" do |req|
        req.body = {list_id: list_id, api_key: @key}
      end

      response.body.to_i
    end

    protected

    def connection
      @connection ||= Faraday.new(:url => @url) do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter

        faraday.use ::Faraday::Response::RaiseCindyError
        faraday.use ::FaradayMiddleware::FollowRedirects
        faraday.use ::FaradayMiddleware::Mashify
      end
    end

  end
end
