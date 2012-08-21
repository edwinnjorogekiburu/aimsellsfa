class AddIndexToSerialBatteryMsisdnToHandsets < ActiveRecord::Migration
  def change
  	add_index :handsets , :serial , unique: true
  	add_index :handsets , :battery_serial , unique: true
  	add_index :handsets , :msisdn , unique: true
  end
end
