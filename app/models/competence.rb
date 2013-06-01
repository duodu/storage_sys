class Competence < ActiveRecord::Base
  attr_accessible :name, :nstatus_id, :ostatus_id
  has_many :users
  belongs_to :nstatus, :class_name => "Status", :foreign_key => "nstatus_id"
  belongs_to :ostatus, :class_name => "Status", :foreign_key => "ostatus_id"
  validates :name, :nstatus_id, :ostatus_id, :presence => true
  validates :name, :uniqueness => true
  validates :nstatus_id, :uniqueness => {:scope => :ostatus_id}
end
