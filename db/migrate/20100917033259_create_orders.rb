class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :created_by
      t.string :good
      t.string :size
      t.string :color
      t.string :quantity
      t.string :case_number
      t.date :ordered_at
      t.string :ordered_by
      t.string :remarks
      t.references :supplier

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
