class TradingAccountView < TradingAccount
  self.table_name = 'trading_account_views'
  self.primary_key = 'id'
end
