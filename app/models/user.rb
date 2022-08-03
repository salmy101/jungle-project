class User < ApplicationRecord

	has_secure_password

	validates :password, length: { minimum: 2 }
  validates :password_confirmation, presence: :true
	validates :name, :email, presence: true, uniqueness: true
	

	
def self.authenticate_with_credentials(email,password)
	user = User.find_by_email(email.strip.downcase)
	if user && user.authenticate(password) #if we compare pass
		 user #correct authenticated user
	else 
		 nil 
	end
end	

  
end
