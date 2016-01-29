class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :user, index: true, foreign_key: true
      t.float :amount
      t.string :note
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
