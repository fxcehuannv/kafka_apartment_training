namespace :test_tenants do
  desc 'test_tenants'
  task run: :environment do
    Apartment::Tenant.each do |tenant|
      Apartment::Tenant.switch(tenant) do
        puts "Count Partner by #### tanent #### #{tenant}: #{Partner.count}"
      end
    end
  end
end

