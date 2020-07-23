class UsersController < ApplicationController
	before_action :authorized, only: [:auto_login]
	
	# Registeration

	def create
		@user = User.create(user_params)
		if @user.valid?
			token = encode_token({user_id: @user.id})
			render json: {user: @user, token: token}
		else
			render json: {error: "invalid email or password"}
		end
	end

	# Login

	def login
		@user = User.find_by(email: params[:email])

		if @user && @user.authenticate(params[:password])
			token = encode_token({user_id: @user.id})
			render json: {user: @user, token: token}
		else
			render json: {error: "invalid email or password"}
		end
	end

	def auto_login
		render json: @user
	end


	private
		def user_params
			params.permit(:email, :password, :name)
		end
end
