class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update, :destroy]


def index
  @clients = Client.all
end

def new
  @clients = Client.new
end

def create
  @client = Client.new(client_params)
    if @client.save
      redirect_to root_path, :notice =>  "Created!"  
    else
      render :new
    end
end   

def destroy
  @client.destroy  
  redirect_to clients_path
end

def update
  if client.update(ticket_params)
    redirect_to clients_path
  else
    render "edit"
end

private

def client_params
  params.require(:client).permit(:name, :surname, :phone, :birth_date, :personal_id)
end

def set_client
  @client = Client.find(params[:id])
end

end