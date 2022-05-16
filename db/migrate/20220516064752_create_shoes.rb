class CreateShoes < ActiveRecord::Migration[6.1]
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :color
      t.float :price
      t.float :size
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
