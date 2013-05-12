class Gallery < ActiveRecord::Base
  attr_accessible :name
  has_many :paintings
  
  accepts_nested_attributes_for :paintings
end
