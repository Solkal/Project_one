class AutosController < ApplicationController

	before_action :set_auto, only: [:edit, :update, :destroy, :show]
	def index
		@autos = Auto.all
	end

	def new
		@auto = Auto.new
	end

	def create
		@auto = Auto.new(auto_params)
		if @auto.save
			redirect_to @auto
		else
			render 'new'
		end
	end

	def update
		if @auto.update(auto_params)
			redirect_to @auto
		else
			render 'edit'
		end
	end

	def destroy
		@auto.delete
		redirect_to autos_path
	end

	private
	
	def set_auto
		@auto =Auto.find(params[:id])
	end
	
	def auto_params
		params.require(:auto).permit(:make, :model, :year)
	end

end
