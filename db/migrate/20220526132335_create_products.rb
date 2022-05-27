class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :category
      t.date :release_date
      t.float :price

      t.timestamps
    end
  end
end
