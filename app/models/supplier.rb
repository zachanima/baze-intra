class Supplier < ActiveRecord::Base
  has_many :orders, :dependent => :destroy
  validates_presence_of :name
  validates_inclusion_of :kind, :in => ['business', 'shop']

  scope :business, where(:kind => 'business').order('name')
  scope :shop, where(:kind => 'shop').order('name')
end
