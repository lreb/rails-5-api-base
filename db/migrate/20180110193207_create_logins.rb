class CreateLogins < ActiveRecord::Migration[5.0]
  def change
    create_table :logins do |t|
      t.string :email
      t.string :password_digest
      t.string :user_name
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
