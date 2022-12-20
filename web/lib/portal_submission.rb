module PortalSubmission
    def send_notification(store_url, action)
        host = ENV.fetch('PORTAL_API_HOST')
        port = ENV.fetch('PORTAL_API_PORT')
        key = ENV.fetch('PORTAL_API_KEY')
        
        logger.info("Ready to send '#{store_url}' #{action}")

        if action == 'activated'
            uri = URI("#{host}:#{port}/integrations/activate")
        elsif action == 'deactivated' 
            uri = URI("#{host}:#{port}/integrations/deactivate")
        else
            return
        end

        payload = {external_identifier: store_url }
        req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
        req.add_field  'Authorization', "Bearer #{key}"
        req.body = payload.to_json
        res = Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(req)
        end

        logger.info("Sent '#{payload.to_json}'")
    end 
end
 