class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:cell_number,:consultant_id,:first_name,:last_name,:orignal_password
  # attr_accessible :title, :body
  has_many :recommends
  has_many :crop_informations
   has_many :sales
    has_many :years
    has_many :cash_sales
    has_many :futures
    has_many :options
    has_many :hedge_to_arrives
    has_many :forward_contracts
    has_many :basic_contracts
    has_many :crop_information_expenses

end
