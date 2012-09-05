class CreateDsaRoutes < ActiveRecord::Migration
  def change
    create_table :dsa_routes do |t|
      t.integer :agent_id
      t.integer :route_id

      t.timestamps

    end
    add_index :dsa_routes, :agent_id ,unique: true
    add_index :dsa_routes, :route_id ,unique: true
    add_index :dsa_routes, [:agent_id, :route_id], unique: true
  end
end
