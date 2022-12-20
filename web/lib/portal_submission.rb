module PortalSubmission
    def send_notification(store_url, action)
        host = ENV.fetch('PORTAL_API_HOST')
        key = ENV.fetch('PORTAL_API_KEY')

        if action == 'activated'
            uri = URI("#{host}/integrations/activate")
        elsif action == 'deactivated' 
            uri = URI("#{host}/integrations/deactivate")
        else
            return
        end

        payload = {external_identifier: store_url }
        req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
        req.add_field  'Authorization', "Bearer #{key}"
        req.body = payload.to_json
        res = Net::HTTP.start(uri.hostname, :use_ssl => uri.scheme == 'https') do |http|
          http.request(req)
        end
    end 
end
 