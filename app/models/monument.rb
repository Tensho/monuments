class Monument < ActiveRecord::Base
  belongs_to :collection
  belongs_to :category
  has_many :pictures
end
