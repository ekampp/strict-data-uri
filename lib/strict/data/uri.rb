# frozen_string_literal: true

require_relative "uri/version"
require "uri/version"
require "base64"

module Strict
  module Data
    module Uri
      Error = Class.new ArgumentError
      InvalidEncoder = Class.new Error
      InvalidDataUri = Class.new Error

      def self.encode(data, type = "text/plain")
        "data:#{type};base64,#{Base64.strict_encode64(data).rstrip}"
      end

      def self.decode(uri)
        raise InvalidDataUri, "invalid data URI: #{uri.inspect}" unless uri.match(/^data:(.*?);(.*?),(.*)$/)

        encoder = Regexp.last_match(2)
        data = Regexp.last_match(3)

        case encoder
        when "base64" then Base64.strict_decode64(data)
        else raise InvalidEncoder, "missing or invalid encoder: #{encoder}"
        end
      end
    end
  end
end
