require 'faraday'
require 'json'
require 'hashie'

module Wordsmith
  class Client

    def get(uri)
      response = connection.get(uri)
      parse_response(response)
    end

    def post(uri, data, proofread:)
      response = connection.post(uri, {data: data, proofread: proofread}.to_json)
      parse_response(response)
    end

    private

    def connection
      return @_connection if connection_valid?
      @_connection = initialize_connection
    end

    def initialize_connection
      Faraday.new(
        url: Wordsmith.configuration.url,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "Bearer #{Wordsmith.configuration.token}",
          'User-Agent' => Wordsmith.configuration.user_agent
        }
      )
    end

    def connection_valid?
      return false unless @_connection
      url = @_connection.url_prefix.to_s
      authorization = @_connection.headers['Authorization']

      url == Wordsmith.configuration.url && valid_token?(authorization)
    end

    def valid_token?(authorization)
      authorization == "Bearer #{Wordsmith.configuration.token}"
    end

    def parse_response(response)
      body = JSON.parse(response.body)
      Hashie.symbolize_keys!(body)
      case response.status
      when 200, 201 then body[:data]
      when 400 then raise(%Q(Bad Request: "#{body[:errors]}"))
      when 401 then raise('API authorization error.')
      when 404 then raise('Incorrect version set in wordsmith.rb')
      when 429 then raise(body[:error])
      else raise('API error')
      end
    end
  end

  module_function

  def client
    @_client ||= Client.new
  end
end
