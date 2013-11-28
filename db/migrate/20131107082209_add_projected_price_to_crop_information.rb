class AddProjectedPriceToCropInformation < ActiveRecord::Migration
  def change
  	add_column :crop_informations, :projected_price, :float
  end
end
