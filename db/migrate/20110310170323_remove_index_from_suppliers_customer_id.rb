class RemoveIndexFromSuppliersCustomerId < ActiveRecord::Migration
  def self.up
    remove_index :suppliers, :customer_id
  end

  def self.down
    add_index :suppliers, :customer_id
  end
end
