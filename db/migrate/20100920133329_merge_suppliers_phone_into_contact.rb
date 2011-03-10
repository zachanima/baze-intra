class MergeSuppliersPhoneIntoContact < ActiveRecord::Migration
  def self.up
    change_column :suppliers, :contact, :text
    say_with_time 'Merge phone into contact' do
      Supplier.all.each do |supplier|
        supplier.contact = [supplier.contact, supplier.phone].join("\n")
        supplier.save
        say "#{supplier.id} was updated."
      end
    end
    remove_column :suppliers, :phone
  end

  def self.down
    add_column :suppliers, :phone, :string
    say_with_time 'Split contact to extract phone' do
      Supplier.all.each do |supplier|
        supplier.phone = supplier.contact.split("\n", 2).last
        supplier.contact = supplier.contact.split("\n").first
        supplier.save
        say "#{supplier.id} was updated."
      end
    end
    change_column :suppliers, :contact, :string
  end
end
