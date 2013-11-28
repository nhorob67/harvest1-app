class AddTotalExpensesToCropInformation < ActiveRecord::Migration
  def change
  	add_column :crop_informations, :total_expenses, :float
  end
end
