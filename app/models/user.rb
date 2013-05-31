class User < ActiveRecord::Base
  attr_accessible :competence_id, :name, :password
  belongs_to :competence
end
