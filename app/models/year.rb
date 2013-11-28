class Year < ActiveRecord::Base
  attr_accessible  :year, :archive,:user_id
  belongs_to :user
   validates_uniqueness_of :year
end
