class GdprController < ApplicationController
    skip_before_action :verify_authenticity_token

    def customer_data_request
        render status: :ok, json: {}
    end

    def customer_redact
        render status: :ok, json: {}
    end

    def shop_redact
        render status: :ok, json: {}
    end
end