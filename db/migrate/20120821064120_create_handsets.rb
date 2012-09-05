class CreateHandsets < ActiveRecord::Migration
  def change
    create_table :handsets do |t|
    	t.string :brand
    	t.string :serial
    	t.string :battery_serial
    	t.string :msisdn
    	t.integer :agent_id
    	t.integer :employee_id
      t.timestamps
    end
  end
end
