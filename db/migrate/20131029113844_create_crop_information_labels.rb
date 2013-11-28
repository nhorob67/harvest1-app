class CreateCropInformationLabels < ActiveRecord::Migration
  def change
    create_table :crop_information_labels do |t|
      t.string :label_name
      t.integer :crop_information_id
      t.string :label_value

      t.timestamps
    end
  end
end
