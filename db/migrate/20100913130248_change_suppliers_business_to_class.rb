class ChangeSuppliersBusinessToClass < ActiveRecord::Migration
  def self.up
    rename_column :suppliers, :business, :kind
    change_column :suppliers, :kind, :string
    say_with_time 'Stringify kind' do
      Supplier.all.each do |supplier|
        if supplier.kind == 't'
          supplier.kind = 'business'
        else
          supplier.kind = 'shop'
        end
        supplier.save
        say "#{supplier.id} was updated."
      end
    end
  end

  def self.down
    say_with_time 'Booleanify kind' do
      Supplier.all.each do |supplier|
        if supplier.kind == 'business'
          supplier.kind = 't'
        else
          supplier.kind = 'f'
        end
        supplier.save
        say "#{supplier.id} was updated."
      end
    end
    rename_column :suppliers, :kind, :business
    change_column :suppliers, :business, :boolean
  end
end
