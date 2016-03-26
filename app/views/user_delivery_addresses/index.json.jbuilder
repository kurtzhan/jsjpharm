json.array!(@user_delivery_addresses) do |user_delivery_address|
  json.extract! user_delivery_address, :id, :user_id, :province_id, :city_id, :district_id, :address, :telephone, :receiver
  json.url user_delivery_address_url(user_delivery_address, format: :json)
end
