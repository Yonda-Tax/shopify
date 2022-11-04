def make_request(store, uri)
    req = Net::HTTP::Get.new(uri)
    req['X-Shopify-Access-Token'] = store.shopify_token
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(req)
    end
end

def get_orders(store)
    uri = URI("https://#{store.shopify_domain}/admin/api/2022-10/orders.json")
    make_request(store, uri)
end

def get_products(store)
    uri = URI("https://#{store.shopify_domain}/admin/api/2022-10/products.json")
    make_request(store, uri)
end

def get_reports(store)
    uri = URI("https://#{store.shopify_domain}/admin/api/2022-10/reports.json")
    make_request(store, uri)
end

namespace :shopify do
    desc 'Fetch Shopify merchant data'
    task fetch_data: [:environment] do
    
    Shop.all.each do |store|
        # orders_response = get_orders(store)
        # products_response = get_products(store)
        reports_response = get_reports(store)
        puts reports_response.body
    end
    end
end