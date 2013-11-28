class AddFieldToOption < ActiveRecord::Migration
  def change
    add_column :options, :year, :integer
  end
end
