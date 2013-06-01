class Status < ActiveRecord::Base
  attr_accessible :name
  has_many :cagos
  validates :name, :presence => true
  validates :name, :uniqueness => true
end
