class RenameTypeToPlace < ActiveRecord::Migration[5.1]
  def change
    rename_column :shelves, :type, :place
  end
end
