class CreateUsers < ActiveRecord::Migration[5.2]
    def change
      create_table :users do |t|
        t.string :user_name
        t.string :password_digest
  
        t.timestamps
      end
      add_index :user, :user_name, unique: true
    end
  end
  