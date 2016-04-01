class Category < ActiveRecord::Base
	has_many :pin, inverse_of: :category
end
