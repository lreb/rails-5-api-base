class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string
    add_column :users, :gender_id, :integer
    add_column :users, :deleted, :boolean
  end
end
