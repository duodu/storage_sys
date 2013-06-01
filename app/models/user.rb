class User < ActiveRecord::Base
  attr_accessible :competence_id, :name, :password, :password_confirmation
  belongs_to :competence
  validates :name, :password, :competence_id, :password_confirmation, :presence => true
  validates :password, :confirmation => true
  validates :name, :uniqueness => true
end
