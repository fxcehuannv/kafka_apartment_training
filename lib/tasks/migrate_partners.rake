namespace :migrate_partners do
  desc 'migrate_partners'
  task import: :environment do
    tenants = [ 'direct', 'axi', 'demo', 'mt5', 'public' ]
    Apartment::Tenant.switch('public') do
      tenants.map { |item| Partner.find_or_create_by(tenant_name: item) }
    end
    puts "######################### DONE #########################"
  end
end

