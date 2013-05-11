class CreateBreads < ActiveRecord::Migration
  def change
    create_table :breads do |t|
      t.string :name

      t.timestamps
    end
  end
end
