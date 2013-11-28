class AddFieldCropNameToForwardContracts < ActiveRecord::Migration
  def change
  	
  		add_column :forward_contracts, :crop_name, :string
  	
  end
end
