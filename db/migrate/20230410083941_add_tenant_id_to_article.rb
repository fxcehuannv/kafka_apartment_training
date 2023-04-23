class AddTenantIdToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :tenant_id, :integer
  end
end
