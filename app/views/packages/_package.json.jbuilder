json.extract! package, :id, :name, :price, :created_at, :updated_at
json.url package_url(package, format: :json)

json.plan do
  json.name package.plan.name
  json.price package.plan.price
end

json.additional_services package.additional_services do |service|
  json.partial! "additional_services/additional_service", additional_service: service
end