class CreateStockIssues < ActiveRecord::Migration
  def change
    create_table :stock_issues do |t|
    	
    	t.integer :agent_id
    	t.integer :item_id
    	t.integer :opening_quantity
    	t.integer :issued_quantity
    	t.decimal :unit_price, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
