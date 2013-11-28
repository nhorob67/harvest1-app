class AddFieldExpenseToCropInformation < ActiveRecord::Migration
  def change
  		add_column :crop_informations, :expense_category, :string
  	
  end
end
