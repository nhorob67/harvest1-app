class CreateExpenseLabels < ActiveRecord::Migration
  def change
    create_table :expense_labels do |t|
      t.string :name

      t.timestamps
    end
  end
end
