class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]

  def index
    @rents = Rent.all
    @rent = Rent.new
  end

  def new
    @rent = Rent.new
  end

  def create
    sleep(5)
    @rent = Rent.new(permitted_params)
    if @rent.save
      if request.xhr?
        @rents = Rent.all
        render partial: 'table', locals: { rents: Rent.all }
      else
        redirect_to rents_path, notice: 'Auto is yours!'
      end
    else
      if request.xhr?
        render body: "Error", locals: { rent: @rent}
      else
        render :new
      end
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
    if request.xhr?
      @rents = Rent.all
      render partial: 'table', locals: { rents: Rent.all }
    else
      redirect_to rents_path, notice: 'Rent was successfully deleted.'
    end
  end

  private

  def permitted_params
    params.require(:rent).permit([:client_id, :auto_id, :date_start, :date_end])
  end

  private 
  def set_rent
    @rent = Rent.find(params[:id])
  end

end

