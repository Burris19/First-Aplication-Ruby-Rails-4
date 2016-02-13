class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@usuarios = User.all
	end

	def show				
	end

	def destroy
		@usuario.destroy
		redirect_to users_url		
	end

	def edit		
	end

	def update

		if @usuario.update_attributes(user_params)
			redirect_to users_url
		else 
			render action: 'edit'
		end

	end


	def new
		@usuario = User.new		
	end

	def create
		@usuario = User.new(user_params)

		if @usuario.save 
			flash[:success] = "Bienvenidos #{@usuario.nombre}"
			redirect_to users_url
		else
			render action: 'new'
		end

	end

	private
	def user_params
		params.require(:user).permit(:email, :nombre, :password, :password_confirmation)
	end

	private
	def set_user
		@usuario = User.find(params[:id])
	end

end
