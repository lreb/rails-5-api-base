class AddDateToItemTest < ActiveRecord::Migration[5.0]
  def change
    add_column :test_items, :date, :datetime
  end
end
