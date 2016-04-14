class User < ActiveRecord::Base

	def self.authenticate(email, password)
		if User.where('email = ? AND password = ?', email, password).nil?
			nil
		else
			@user = User.where('email = ? AND password = ?', email, password)
		end
	end

end
