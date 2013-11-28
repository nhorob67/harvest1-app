class CreateCropInformationExpenses < ActiveRecord::Migration
  def change
    create_table :crop_information_expenses do |t|
      t.string :expense
      t.integer :user_id
      t.integer :year

      t.timestamps
    end
  end
end
