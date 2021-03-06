class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name, :limit => 100, :default => 'Your Name', :null => true
      t.string :state, :null => :false, :default => 'passive'      
      t.datetime :activated_at
      t.datetime :deleted_at
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end
    add_index :users, :email

  end
end
