class User < ActiveRecord::Base
  
  # There is a lot of magic going on in `has_secure_password` below:
  #
  #  - Creates attribute accessors for password and password_confirmation
  #  - Adds a validation to ensure password == password_confirmation
  #  - Before saving, hashes password and stores it in password_digest

  has_secure_password
  
  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, :presence => true
  validates :email, { :presence => true, :uniqueness => true }

end
