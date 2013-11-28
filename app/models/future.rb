class Future < ActiveRecord::Base
  attr_accessible :contract,:year, :future_month, :futures_price, :gain_loss, :long_short, :open_order,:user_id,:crop_name
  belongs_to :user
end
