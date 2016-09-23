class InvitesController < ApplicationController
	def accept
		inviter = User.find(params[:id])
		accepter = User.find(session[:id])
		invite = Invite.find_by(user: inviter, invitee: accepter)
		invite.destroy
		Network.create(user:inviter, networkee: accepter)
		Network.create(user: accepter, networkee: inviter)
		redirect_to '/professional_profile'
	end
	def destroy
		inviter = User.find(params[:id])
		accepter = User.find(session[:id])
		invite = Invite.find_by(user: inviter, invitee: accepter)
		invite.destroy
		redirect_to '/professional_profile'
	end
	def create
		Invite.create(user:User.find(session[:id]), invitee: User.find(params[:id]))
		redirect_to '/users'
	end
end
