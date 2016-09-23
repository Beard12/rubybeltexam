require 'rails_helper'

RSpec.describe User do
	it 'requires an email' do
		user = User.new(email: '')
		user.valid?
		expect(user.errors[:email].any?).to eq(true)
	end
	it 'rejects email in the incorrect format' do
		user = User.new(email: 'ifjief----)&')
		user.valid?
		expect(user.errors[:email].any?).to eq(true)
	end
	it 'accepts email in the correct format' do
		user = User.new(email: 'test123@gmail.com')
		user.valid?
		expect(user.errors[:email].any?).to eq(false)
	end
  	it 'requires a name' do
    	user = User.new(name: '')
    	user.valid?
    	expect(user.errors[:name].any?).to eq(true)
  	end
  	it 'requires a name to be solely alpha characters' do
  		user = User.new(name: 'WOWOWEEEEIDFJD090')
  		user.valid?
  		expect(user.errors[:name].any?).to eq(true)
  	end
  	 it 'requires a description' do
    	user = User.new(description: '')
    	user.valid?
    	expect(user.errors[:name].any?).to eq(true)
  	end

end
