class CropInformationExpense < ActiveRecord::Base
  attr_accessible :expense, :user_id, :year,:crop_information_id,:label_name
  belongs_to :user
end
