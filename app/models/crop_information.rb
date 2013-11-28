class CropInformation < ActiveRecord::Base
  attr_accessible :acre, :crop_name, :expenses, :user_id, :year,:archive,:production,:fertilizer,:seed,:chemical,:insurance,:fuel,:land_cost,:overhead,:family_living,:breakeven,:yield,:expense_category,:total_expenses,:projected_price
  belongs_to :user

end

