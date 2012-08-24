class CreateOnhandQuantities < ActiveRecord::Migration
  def change
    create_table :onhand_quantities do |t|
    	t.integer :agent_id
    	t.integer :item_id
    	t.integer :onhand_quantity
      t.timestamps
    end
    add_index :onhand_quantities, [:agent_id, :item_id], unique: true
  end
end
