class UsersController < ApplicationController
	def home

	end
	def register
		user = User.new(user_params)
		if user.save
			session[:id] = user.id
			redirect_to '/professional_profile'
		else
			flash[:errors]=user.errors.full_messages
			redirect_to '/'
		end

	end
	def login
		user = User.find_by(email:params[:email])
		if user && user.authenticate(params[:password])
			session[:id] = user.id
			redirect_to '/professional_profile'
		elsif user
			flash[:logerror] = "Your password does not match our records"
			redirect_to '/'
		else
			flash[:logerror] = "Your email does not match any of our records"
			redirect_to '/'
		end 

	end
	def profess_profile
		@user = User.find(session[:id])
		@invites = Invite.where(invitee: @user)
	end
	def networkdest
		network= Network.find_by(user: User.find(session[:id]), networkee: User.find(params[:id]))
		oppositeside = Network.find_by(user: User.find(params[:id]), networkee: User.find(session[:id]))
		network.destroy
		oppositeside.destroy
		redirect_to '/professional_profile'
	end
	def index
		@user = User.find(session[:id])
		usersinnetwork = @user.networkees
		usersinvited = @user.invitees
		invites = Invite.where(invitee: @user)
		inviteduser = []
		invites.each do |inv|
			inviteduser.push(inv.user)
		end
		users = User.all
		@nonconnect = []
		users.each do |user|
			if (usersinnetwork.include? user) || (usersinvited.include? user) || (inviteduser.include? user)

			else
				@nonconnect.push(user)
			end
		end
		@nonconnect.delete(@user)
	end
	def logout
		session[:id] = nil
		redirect_to '/'
	end
	def show 
		@user = User.find(params[:id])
	end
	private
	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation, :description)
	end

end
