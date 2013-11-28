class AddOrignalPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :orignal_password, :string
  end
end
