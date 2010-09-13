class Supplier < ActiveRecord::Base
  scope :business, where(:business => true)
  scope :shop, where(:business => false)
end
