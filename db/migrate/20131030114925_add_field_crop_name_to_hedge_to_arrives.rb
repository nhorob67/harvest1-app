class AddFieldCropNameToHedgeToArrives < ActiveRecord::Migration
  def change
  	add_column :hedge_to_arrives, :crop_name, :string
  end
end
