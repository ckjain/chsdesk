class AddTenantToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :tenant_id, :integer
    add_index :articles, :tenant_id
  end
end
