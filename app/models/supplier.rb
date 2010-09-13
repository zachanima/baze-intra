class Supplier < ActiveRecord::Base
  scope :business, where(:kind => 'business')
  scope :shop, where(:kind => 'shop')
end
