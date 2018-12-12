class UsersController < ApplicationController

	def new
		@user = User.new()
	end

	def create

		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				format.html { redirect_to histories_path, notice: 'user was successfully created.' }
				format.json { render :show, status: :created, location: @company }
			else
				format.html { render :new }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
