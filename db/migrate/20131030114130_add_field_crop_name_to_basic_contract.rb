class AddFieldCropNameToBasicContract < ActiveRecord::Migration
  def change
  	add_column :basic_contracts, :crop_name, :string
  end
end
