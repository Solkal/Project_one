class UsersController < ApplicationController

http_basic_authenticate_with name: "dhh", password: "secret"

def index
  @autos_paginate = Auto.paginate(:page => params[:page], :per_page => 10)
  @clients_paginate = Client.paginate(:page => params[:page], :per_page => 10)
  @autos = Auto.all
  @clients = Client.all
end

end
