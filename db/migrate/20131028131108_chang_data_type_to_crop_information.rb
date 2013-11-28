class ChangDataTypeToCropInformation < ActiveRecord::Migration
  def up
  change_column :crop_informations, :production, :float
  change_column :crop_informations, :total_expenses, :float
  end
end
