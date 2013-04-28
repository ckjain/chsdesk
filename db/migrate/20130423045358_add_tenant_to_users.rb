class AddTenantToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tenant_id, :integer
    add_index :users, :tenant_id
    add_column :users, :date_of_birth, :date
    add_column :users, :phone_number, :string, :limit => 20, :default => '0000000000', :null => true
    add_column :users, :zip, :string, :limit => 20, :default => '400 000', :null => true
    add_column :users, :bio, :text
    add_column :users, :avatar_url, :string

  end
end
