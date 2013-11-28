class AddFieldToForwardContract < ActiveRecord::Migration
  def change
    add_column :forward_contracts, :year, :integer
  end
end
