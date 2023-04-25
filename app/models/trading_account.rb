class TradingAccount < ApplicationRecord
  # == Callbacks ============================================================
  after_commit :refresh_trading_account_view, on: %i[create update]

  private

  # == Instant Methods ========================================================
  def refresh_trading_account_view
    drop_trading_account_view
    create_trading_account_view
  end

  def drop_trading_account_view
    Apartment.tenant_names.each do |tenant|
      Apartment::Tenant.switch tenant do
        ActiveRecord::Base.connection.execute("DROP VIEW IF EXISTS #{tenant}.trading_account_views")
      end
    end

    puts 'DROP DONE !!!'
  end

  def create_trading_account_view
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
