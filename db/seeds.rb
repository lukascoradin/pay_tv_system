client_one = Client.create!(name: "Lucas", date_of_birth: Date.new(1994, 6, 23))
client_two = Client.create!(name: "Antonio", date_of_birth: Date.new(1960, 1, 21))
client_three = Client.create!(name: "Jose", date_of_birth: Date.new(2000, 7, 23))

plan_one = Plan.create!(name: "Plano Básico", price: 100.00)
plan_two = Plan.create!(name: "Plano Total", price: 200.00)

service_one = AdditionalService.create!(name: "HBO", price: 30.00)
service_two = AdditionalService.create!(name: "Telecine", price: 40.00)

package_one = Package.create!(name: "Pacote Filmes", plan: plan_two, additional_services: [service_one, service_two], price: 250.00)
package_two = Package.create!(name: "Pacote HBO", plan: plan_one, additional_services: [service_one])

subscription_one = Subscription.create!(client: client_one, plan: plan_one)
subscription_two = Subscription.create!(client: client_two, plan: plan_two, additional_services: [service_one, service_two])
subscription_one = Subscription.create!(client: client_one, package: package_one)
