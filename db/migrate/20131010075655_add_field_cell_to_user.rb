class AddFieldCellToUser < ActiveRecord::Migration
  def change
  	add_column :users, :cell_number, :bigint
  	add_column :users, :consultant_id, :integer
  end
end
