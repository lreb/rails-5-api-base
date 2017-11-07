class CreateSystemCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :system_collections do |t|
      t.string :internal_name
      t.string :external_name
      t.string :type
      t.boolean :deleted

      t.timestamps
    end
  end
end
