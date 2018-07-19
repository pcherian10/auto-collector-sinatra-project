class AutosController < ApplicationController

  get "/garages" do
    redirect_if_not_logged_in
    @garages = Garage.all
    erb :'garage/index'
  end

  get "/garages/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'garages/new'

  end

  get "/garages/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @garage = Garage.find(parmas[:id])
    erb :'garages/edit'
  end

  post "/garages/:id" do

  end

  get "/garages/:id" do

  end

  post "/garages" do

  end

end
