require "spec_helper"

RSpec.describe "Our Application Routes" do
  	describe "GET /pins/name-:slug" do
  		
  		it 'populates the @pin variable with appropriate pin' do
  			pin = Pin.first
  			get "/pins/name-#{pin.slug}"
  			expect(assigns[:pin]).to eq(Pin.find(1))
  		end

  	end
end