class CreateCropInformations < ActiveRecord::Migration
  def change
    create_table :crop_informations do |t|
      t.string :crop_name
      t.string :acre
      t.integer :year
      t.float :expenses
      t.integer :user_id

      t.timestamps
    end
  end
end
