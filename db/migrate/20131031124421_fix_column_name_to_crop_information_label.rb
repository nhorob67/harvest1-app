class FixColumnNameToCropInformationLabel < ActiveRecord::Migration
   def change
    rename_column :crop_information_labels, :crop_information_id, :year
  end
end
