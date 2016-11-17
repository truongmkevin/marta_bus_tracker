module LocationsHelper

  def fetch_api_data(source)
    http = Net::HTTP.get_response(URI.parse(source))
    data = http.body
    return JSON.parse(data)
  end

  def is_nearby(lat_user, long_user, lat_bus, long_bus)
    (long_user.to_f - long_bus.to_f).abs <= 0.01 && (lat_user.to_f - lat_bus.to_f).abs <= 0.01
  end

end
