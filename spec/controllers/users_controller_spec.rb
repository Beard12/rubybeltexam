require 'rails_helper'
RSpec.describe UsersController do
	describe "routing" do 
		it "routes /users to the users index controller method" do
			expect(:get => "/users").to route_to(:controller => "users", :action => "index")
		end
		it "routes /users/:id to the users show controller method" do
			expect(:get => "/users/1").to route_to(:controller => "users", :action => "show", :id => "1")
		end
	end
end
