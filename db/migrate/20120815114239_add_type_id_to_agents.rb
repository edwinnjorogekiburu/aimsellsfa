class AddTypeIdToAgents < ActiveRecord::Migration
  def change
  	add_column :agents , :type_id ,:integer
  end
end
