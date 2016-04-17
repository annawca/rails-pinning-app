require 'spec_helper'

RSpec.describe User, type: :model do
	before(:all) do
		@user = User.create(email: "coder@skillcrush.com", password: "password")
	end

	after(:all) do
		if !@user.destroyed?
			@user.destroy
		end
	end

	it 'authenticates and returns a user when valid email and password passed in' do
		user = User.authenticate(@user.email, @user.password)
		expect(user).to_not eq(nil)
	end

	it { should validate_presence_of(:first_name) }
	it { should validate_presence_of(:last_name) }
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:password) }

#  pending "add some examples to (or delete) #{__FILE__}"
end
