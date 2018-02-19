class AddUniqueIndexToShelves < ActiveRecord::Migration[5.1]
  def change
    add_index :shelves, [:book_id,:user_id], unique: true
  end
  
end
