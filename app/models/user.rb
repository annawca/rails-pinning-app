class User < ActiveRecord::Base

	def self.authenticate(email, password)
		user = User.find_by(email: email)
		if user.nil?
			user = nil
		elsif user.password == password
			user
		end
	end

end
