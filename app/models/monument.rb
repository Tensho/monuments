class Monument < ActiveRecord::Base
  belongs_to :collection
  has_one :category
end
