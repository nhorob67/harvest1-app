class BasicContract < ActiveRecord::Base
  attr_accessible :basic, :bushels,:year, :cash_price, :contact_number, :delivery_location, :future_month, :futures_price, :open_order, :percentage_production,:user_id,:crop_name
  belongs_to :user
end
