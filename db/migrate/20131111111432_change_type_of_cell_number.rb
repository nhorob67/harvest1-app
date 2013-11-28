class ChangeTypeOfCellNumber < ActiveRecord::Migration
  def up
  change_column :users, :cell_number, :string
  end
end
