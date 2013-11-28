class AddUserIdToCropInformationLabel < ActiveRecord::Migration
  def change
  	add_column :crop_information_labels, :user_id, :integer
  end
end
