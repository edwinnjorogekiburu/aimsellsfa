class ChangeDataTypeForPriceAndRetailPrice < ActiveRecord::Migration
  def up
    change_table :items do |t|
      t.change :price, :decimal, :precision => 10, :scale => 2
      t.change :retail_price, :decimal, :precision => 10, :scale => 2
    end
  end
  def down
    change_table :items do |t|
      t.change :price, :integer
      t.change :retail_price, :integer
    end
  end
end
