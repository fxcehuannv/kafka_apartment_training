namespace :create_trading_account_views do
  desc 'create_trading_account_views'
  task import: :environment do
    Apartment.tenant_names.each do |tenant|
      Apartment::Tenant.switch tenant do
        TradingAccount.delete_all
      end
    end

    puts 'DELETE TradingAccount DONE!!!'

    Apartment.tenant_names.each do |tenant|
      Apartment::Tenant.switch tenant do
        10.times do |index|
          TradingAccount.create(
            login: "Login #{index}",
            name: "Name #{index}"
          )
        end
      end
    end

    puts 'CREATE TradingAccount DONE!!!'

    Apartment.tenant_names.each do |tenant|
      Apartment::Tenant.switch tenant do
        ActiveRecord::Base.connection.execute("DROP VIEW IF EXISTS #{tenant}.trading_account_views")
      end
    end

    puts 'DROP DONE !!!'

    Apartment.tenant_names.each do |tenant|
      Apartment::Tenant.switch tenant do
        ActiveRecord::Base.connection.execute(
          <<~SQL
            CREATE VIEW trading_account_views AS
            SELECT * FROM #{tenant}.trading_accounts
          SQL
        )
      end
    end

    puts 'CREATE VIEW DONE !!!'
  end
end
