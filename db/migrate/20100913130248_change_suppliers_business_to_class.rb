class ChangeSuppliersBusinessToClass < ActiveRecord::Migration
  def self.up
    rename_column :suppliers, :business, :kind
    change_column :suppliers, :kind, :string
    Supplier.all.each do |supplier|
      if supplier.kind == 't'
        supplier.kind = 'business'
      else
        supplier.kind = 'shop'
      end
      supplier.save
    end
  end

  def self.down
    Supplier.all.each do |supplier|
      if supplier.kind == 'business'
        supplier.kind = 't'
      else
        supplier.kind = 'f'
      end
      supplier.save
    end
    rename_column :suppliers, :kind, :business
    change_column :suppliers, :business, :boolean
  end
end
