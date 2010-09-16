class Supplier < ActiveRecord::Base
  validates_presence_of :name
  validates_inclusion_of :kind, :in => ['business', 'shop']

  scope :business, where(:kind => 'business')
  scope :shop, where(:kind => 'shop')
end
