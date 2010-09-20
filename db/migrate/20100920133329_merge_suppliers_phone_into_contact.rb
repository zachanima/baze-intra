class MergeSuppliersPhoneIntoContact < ActiveRecord::Migration
  def self.up
    change_column :suppliers, :contact, :text
    Supplier.all.each do |supplier|
      supplier.contact = [supplier.contact, supplier.phone].join("\n")
      supplier.save
    end
    remove_column :suppliers, :phone
  end

  def self.down
    add_column :suppliers, :phone, :string
    Supplier.all.each do |supplier|
      supplier.phone = supplier.contact.split("\n", 2).last
      supplier.contact = supplier.contact.split("\n").first
      supplier.save
    end
    change_column :suppliers, :contact, :string
  end
end
