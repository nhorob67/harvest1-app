class Option < ActiveRecord::Base
  attr_accessible :contract,:year, :gain_loss, :long_short, :open_order, :premium, :put_call, :strike_price,:user_id,:crop_name
  belongs_to :user
end
