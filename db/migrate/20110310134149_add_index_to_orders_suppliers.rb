class AddIndexToOrdersSuppliers < ActiveRecord::Migration
  def self.up
    add_index :orders, :supplier_id
    add_index :suppliers, :customer_id
  end

  def self.down
    remove_index :orders, :supplier_id
    remove_index :suppliers, :customer_id
  end
end
