class Cago < ActiveRecord::Base
  attr_accessible :name, :status_id
  belongs_to :status
  belongs_to :history
end
