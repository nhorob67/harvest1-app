class AddFieldToBasicContract < ActiveRecord::Migration
  def change
    add_column :basic_contracts, :year, :integer
  end
end
