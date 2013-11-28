class AddFieldsToCropInformation < ActiveRecord::Migration
  def change
  	add_column :crop_informations, :yield, :string
  	add_column :crop_informations, :production, :integer
  	add_column :crop_informations, :fertilizer, :text
  	add_column :crop_informations, :seed, :text
  	add_column :crop_informations, :chemical, :text
  	add_column :crop_informations, :insurance, :boolean
  	add_column :crop_informations, :fuel, :text
  	add_column :crop_informations, :land_cost, :integer
  	add_column :crop_informations, :overhead, :text
  	add_column :crop_informations, :family_living, :integer
  	add_column :crop_informations, :breakeven, :string
  end
end
