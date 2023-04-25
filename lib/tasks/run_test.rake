namespace :run_test do
  desc 'run_test'
  task import: :environment do
    Apartment.tenant_names.each do |tenant|
      Apartment::Tenant.switch tenant do
        trading_accounts = TradingAccount.count
        debugger
        trading_account_views = TradingAccountView.count
        puts "Should true: #{trading_accounts == trading_account_views}"
      end
    end
  end
end
