class AddFieldForHedgeToArrive < ActiveRecord::Migration
  def change
    add_column :hedge_to_arrives, :year, :integer
  end
end
