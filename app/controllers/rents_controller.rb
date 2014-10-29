class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]

  def index
    @rents = Rent.all
  end

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(permitted_params)
    if @rent.save
      redirect_to rents_path, notice: 'Rent was successfully created.' 
    else
      render :new
    end
  end

  def show 
  end

  def edit
  end

  def update  
    if  @rent.update(permitted_params)
      redirect_to @rent, notice: 'Rent was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @rent.destroy
    redirect_to rents_path, notice: 'Rent was successfully deleted.'
  end

  private

  def permitted_params
    params.require(:rent).permit([:client_id, :car_id, :date_start, :date_end])
  end

  private 
  def set_rent
    @rent = Rent.find(params[:id])
  end

end

