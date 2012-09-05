class CreateMaterialTransactions < ActiveRecord::Migration
  def change
    create_table :material_transactions do |t|
      t.integer :agent_id
      t.integer :employee_id
      t.integer :outlet_id
      t.integer :issue_id
      t.integer :item_id
      t.integer :transaction_type_id
      t.decimal :unit_price
      t.decimal :transaction_quantity
      t.decimal :transaction_value
      t.decimal :cash_received

      t.timestamps
    end
  end
end
