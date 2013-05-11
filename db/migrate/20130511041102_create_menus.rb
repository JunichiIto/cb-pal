class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.references :bread
      t.decimal :quantity

      t.timestamps
    end
    add_index :menus, :bread_id
  end
end
