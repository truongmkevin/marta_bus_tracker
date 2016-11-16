module LocationsHelper

  def fetch_api_data(source)
    http = Net::HTTP.get_response(URI.parse(source))
    data = http.body
    return JSON.parse(data)
  end

  def is_nearby(lat_user, long_user, lat_bus, long_bus)
    (long_user - long_bus).abs <= 0.01 && (lat_user - lat_bus).abs <= 0.01
  end

end
