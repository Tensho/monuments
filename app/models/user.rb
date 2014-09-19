class User < ActiveRecord::Base
  has_many :collections
  has_many :categories

  has_secure_password
end
