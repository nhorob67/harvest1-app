class CashSale < ActiveRecord::Base
  attr_accessible :basic, :bushels, :cash_price, :contact_number, :delivery_location, :futures_price, :open_order, :percentage_production,:year,:user_id,:crop_name
  belongs_to :user
end
