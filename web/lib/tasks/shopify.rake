# require 'shopify_app'

def get_orders(store)
    uri = URI("https://#{store.shopify_domain}/admin/api/2022-10/orders.json")
    req = Net::HTTP::Get.new(uri)
    req['X-Shopify-Access-Token'] = store.shopify_token
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(req)
    end
    puts res.body
end

def get_products(store)
    uri = URI("https://#{store.shopify_domain}/admin/api/2022-10/products.json")
    req = Net::HTTP::Get.new(uri)
    req['X-Shopify-Access-Token'] = store.shopify_token
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(req)
    end
    puts res.body
end

def get_reports(store)
    uri = URI("https://#{store.shopify_domain}/admin/api/2022-10/reports.json")
    req = Net::HTTP::Get.new(uri)
    req['X-Shopify-Access-Token'] = store.shopify_token
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(req)
    end
    puts res.body
end

namespace :shopify do
    desc 'Fetch Shopify merchant data'
    task fetch_data: [:environment] do
    
    Shop.all.each do |store|
        orders = get_orders(store)
        products = get_products(store)
        reports = get_reports(store)
    end
    end
end