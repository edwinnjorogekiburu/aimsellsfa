class CreateCashIns < ActiveRecord::Migration
  def change
    create_table :cash_ins do |t|
      t.string :item_id
      t.integer :agent_id
      t.decimal :cash_received, :precision => 10, :scale => 2
      t.decimal :sales_value, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
