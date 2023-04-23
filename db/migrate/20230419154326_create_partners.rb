class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :tenant_name

      t.timestamps
    end
  end
end
