class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :tokens
      t.string :encrypted_text

      t.timestamps null: false
    end
  end
end
