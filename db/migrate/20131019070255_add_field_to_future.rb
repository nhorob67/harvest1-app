class AddFieldToFuture < ActiveRecord::Migration
  def change
    add_column :futures, :year, :integer
  end
end
