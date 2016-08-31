class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(username: params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			sign_in(user)
			remember(user)
			redirect_to posts_index_url
		else
			flash[:danger] = "Invalid username/password combination"
			render :new
		end
	end

	def destroy
		sign_out if signed_in?
		redirect_to root_url
	end
end
