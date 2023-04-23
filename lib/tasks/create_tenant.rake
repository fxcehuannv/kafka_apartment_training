namespace :create_tenants do
  desc 'create_tenants'
  task import: :environment do
    [ 'direct', 'axi', 'demo', 'mt5' ].map { |tenant| Apartment::Tenant.create tenant }
    puts "######################### DONE #########################"
  end
end

