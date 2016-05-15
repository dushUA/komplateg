json.array!(@services) do |service|
  json.extract! service, :id, :name_service
  json.url service_url(service, format: :json)
end
