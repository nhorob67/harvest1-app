class AddFieldLabelToCropInformationExpenses < ActiveRecord::Migration
  def change
  	add_column :crop_information_expenses, :label_name, :string
  	add_column :crop_information_expenses, :crop_information_id, :integer
  end
end
