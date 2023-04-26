class AddCountToBitcoins < ActiveRecord::Migration[5.0]
  def change
    add_column :bitcoins, :count, :integer
  end
end
