# frozen_string_literal: true

class AppUninstalledJob < ActiveJob::Base
  extend ShopifyAPI::Webhooks::Handler
  include PortalSubmission
  
  class << self
    def handle(topic:, shop:, body:)
      perform_later(topic: topic, shop_domain: shop, webhook: body)
    end
  end

  def perform(topic:, shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    if shop.nil?
      logger.error("#{self.class} failed: cannot find shop with domain '#{shop_domain}'")
      return
    end

    logger.info("#{self.class} started for shop '#{shop_domain}'")
    shop.destroy

    send_notification(shop_domain, 'deactivated')
  end
end
