class Sale < ActiveRecord::Base
  attr_accessible :basis, :bushel, :cash_prise, :contract, :delivery_location, :future_month, :open_order, :premium, :sale_duration, :sale_income, :sale_type, :strike_price,:user_id
  belongs_to :user
end
