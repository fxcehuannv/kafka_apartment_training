class CreateTradingAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :trading_accounts do |t|
      t.integer :login
      t.string :name

      t.timestamps
    end
  end
end
