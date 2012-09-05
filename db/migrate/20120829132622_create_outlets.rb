class CreateOutlets < ActiveRecord::Migration
  def change
    create_table :outlets do |t|
      t.integer :agent_id
      t.integer :route_id
      t.string :name
      t.string :contact_name
      t.string :contact_phone

      t.timestamps
    end
  end
end
