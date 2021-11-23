# frozen_string_literal: true

require_relative "uri/version"
require "uri/version"
require "base64"

module Strict
  module Data
    module Uri
      class Error < StandardError; end

      def self.encode(data, type = "text/plain")
        "data:#{type};base64,#{Base64.strict_encode64(data).rstrip}"
      end

      def self.decode(uri)
        if uri.match(/^data:(.*?);(.*?),(.*)$/)
          # type = Regexp.last_match(1)
          encoder = Regexp.last_match(2)
          data = Regexp.last_match(3)
          return Base64.decode64(data) if encoder == "base64"
        end

        raise "Illegal format error: #{uri.inspect}"
      end
    end
  end
end
