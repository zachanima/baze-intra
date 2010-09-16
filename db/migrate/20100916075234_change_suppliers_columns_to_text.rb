class ChangeSuppliersColumnsToText < ActiveRecord::Migration
  def self.up
    change_column :suppliers, :return_policy, :text
    change_column :suppliers, :remarks, :text
  end

  def self.down
    change_column :suppliers, :return_policy, :string
    change_column :suppliers, :remarks, :string
  end
end
