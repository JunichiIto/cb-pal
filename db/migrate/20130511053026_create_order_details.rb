class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.references :order
      t.references :bread
      t.decimal :quantity

      t.timestamps
    end
    add_index :order_details, :order_id
    add_index :order_details, :bread_id
  end
end
