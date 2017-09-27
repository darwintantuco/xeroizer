module Xeroizer
  module ApplicationHttpProxy

    def self.included(base)
      base.send :include, InstanceMethods
    end

    module InstanceMethods

      # URL end-point for this model.
      def url
        @application.xero_url + '/' + api_controller_name
      end

      def http_get(extra_params = {})
        extra_params.reverse_merge!(response: application.api_format)
        application.http_get(application.client, url, extra_params)
      end

      def http_put(xml, extra_params = {})
        extra_params.reverse_merge!(response: application.api_format)
        application.http_put(application.client, url, xml, extra_params)
      end

      def http_post(xml, extra_params = {})
        extra_params.reverse_merge!(response: application.api_format)
        application.http_post(application.client, url, xml, extra_params)
      end

    end

  end
end
