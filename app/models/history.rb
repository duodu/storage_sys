class History < ActiveRecord::Base
  attr_accessible :cago_id, :prior_status_id, :status_id, :user_id
  has_many :cagos
  has_many :users
  has_many :statuses, :foreign_key => "status_id"
  has_many :statuses, :foreign_key => "prior_status_id"
  validates :cago_id, :prior_status_id, :status_id, :user_id, :presence => true 
end
