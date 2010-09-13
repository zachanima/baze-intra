class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :name
      t.string :customer_id
      t.string :contact
      t.string :phone
      t.string :email
      t.string :return_policy
      t.string :remarks
      t.boolean :business

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
