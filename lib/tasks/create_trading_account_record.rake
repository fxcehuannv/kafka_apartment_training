namespace :create_trading_account_record do
  desc 'create_trading_account_record'
  task import: :environment do
    Apartment.tenant_names.each do |tenant|
      Apartment::Tenant.switch tenant do
        index = TradingAccount.last.id + 1
        TradingAccount.create(
          login: "Login #{index}",
          name: "Name #{index}"
        )
      end
    end
  end
end
