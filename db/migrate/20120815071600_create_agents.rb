class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|

    	t.string :username
    	t.string :email
    	t.string :password_digest
    	t.string :remember_token
    	t.string :name
    	t.integer :distributor_id
    	t.string :contact_name
    	t.integer :phone

      t.timestamps
    end
  end
end
