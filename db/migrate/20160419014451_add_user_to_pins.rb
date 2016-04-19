class AddUserToPins < ActiveRecord::Migration
  def change
    add_reference :pins, :user, index: true
    add_foreign_key :pins, :users
	
	user = User.create(
    	first_name: "Admin",
    	last_name: "Pinner",
    	email: "adminpinner@email.com",
    	password: "4dm1np1nn3r"
    )
    if user.present?
    	Pin.all.each do |pin|
    		pin.user = user
    		pin.save
    	end
    else
    	puts "User not present"
    end
  end
end
