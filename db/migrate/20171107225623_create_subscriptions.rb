class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :name, :default => 'my subscription'
      t.boolean :deleted, :default => false

      t.timestamps
    end
  end
end
