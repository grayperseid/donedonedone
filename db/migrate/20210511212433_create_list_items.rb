class CreateListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :list_items do |t|
      t.column :description, :string, null: false
      t.column :complete, :boolean, default: false
      t.timestamps
    end
  end
end
