class User < ApplicationRecord 
  validates_presence_of :email, :name 
  validates_uniqueness_of :email
  validates_presence_of :password_digest, confirmation: true

  has_secure_password
end 