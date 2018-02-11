class CreateShelves < ActiveRecord::Migration[5.1]
  def change
    create_table :shelves do |t|
      t.integer :type
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
