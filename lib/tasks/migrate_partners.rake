namespace :migrate_partners do
  desc 'migrate_partners'
  task start: :environment do
    [ 'game', 'bitcoin', 'price', 'marketcap', 'public' ].map { |item| Partner.create(tenant_name: item) }
  end
end

