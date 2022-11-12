class GdprController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :verify_hmac    

    CLIENT_SECRET = ENV['SHOPIFY_API_SECRET']

    def customer_data_request
        render status: :ok, json: {}
    end

    def customer_redact
        render status: :ok, json: {}
    end

    def shop_redact
        render status: :ok, json: {}
    end

    private
    
    def verify_hmac
        request.body.rewind
        data = request.body.read
        verified = verify_webhook(data, request.headers['HTTP_X_SHOPIFY_HMAC_SHA256'])
        return render status: :unauthorized, json: {} unless verified        
    end

    def verify_webhook(data, hmac_header)
        calculated_hmac = Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', CLIENT_SECRET, data))
        ActiveSupport::SecurityUtils.secure_compare(calculated_hmac, hmac_header)
    end
    
end