class AddFieldToYear < ActiveRecord::Migration
  def change
    add_column :years, :archive, :boolean
  end
end
