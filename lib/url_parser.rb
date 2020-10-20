# frozen_string_literal: true

require 'net/http'

class UrlParser
  def self.remote_file_exists?(url)
    url = URI.parse(url)
    raise Errors::InvalidUrlError unless %w[http https].include?(url.scheme)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')

    http.start do |request|
      res = request.head(url.request_uri)
      raise Errors::InvalidImageUrlError if res['Content-Type'].nil? || !(res['Content-Type'].start_with? 'image')
    end
    true
  end
end
