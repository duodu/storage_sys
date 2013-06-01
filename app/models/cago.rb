class Cago < ActiveRecord::Base
  attr_accessible :name, :status_id
  belongs_to :status
  belongs_to :history
  validates :name, :status_id, :presence => true
end
