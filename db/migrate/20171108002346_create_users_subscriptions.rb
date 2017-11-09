class CreateUsersSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :users_subscriptions do |t|
      t.references :user, foreign_key: true, :null => false
      t.references :subscription, foreign_key: true, :null => false
      t.boolean :is_admin, :default => false

      t.timestamps
    end
  end
end
