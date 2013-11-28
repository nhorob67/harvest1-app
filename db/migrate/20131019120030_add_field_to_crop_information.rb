class AddFieldToCropInformation < ActiveRecord::Migration
  def change
    add_column :crop_informations, :archive, :boolean
  end
end
