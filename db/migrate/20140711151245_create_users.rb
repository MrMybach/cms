class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "first_name", :limit => 20
      t.string "last_name", :limit => 50
      t.string "email", :limit => 50, :default => "", :null => false
      t.string "username", :limit => 25
      t.string "hashed_password", :limit => 50
      t.boolean "active"
      t.timestamps
    end
    add_index("users", "username")
  end
end
