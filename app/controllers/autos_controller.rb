class AutosController < ApplicationController

  get "/autos" do
    redirect_if_not_logged_in
    @autos = Auto.all
    erb :'autos/index'
  end

  get "/garages/:id/autos" do
    redirect_if_not_logged_in
    @garage = Garage.find(params[:id])
    @autos = @garage.autos
    erb :'autos/index'
  end

  get "/autos/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'autos/new'
  end

  get "/autos/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @auto = Auto.find(params[:id])
    erb :'autos/edit'
  end

  post "/autos/:id" do
    redirect_if_not_logged_in
    @auto = Auto.find(params[:id])
    unless Auto.valid_params?(params)
      redirect "/autos/#{@auto.id}/edit?error=invalid auto"
    end
    @auto.update(params.select{|k| k == "name"|| k=="manufacturer" || k=="garage_id"})
    redirect "/autos/#{@auto.id}"
  end

  get "/autos/:id" do
    redirect_if_not_logged_in
    @auto = Auto.find(params[:id])
    erb :'autos/show'
  end

  post "/autos" do
    redirect_if_not_logged_in
    unless Auto.valid_params?(params)
      redirect "/autos/new?error=invalid auto"
    end
    @auto = Auto.create(params)
    @garage = @auto.garage
    @autos = @garage.autos
    erb  :'/autos/index'
  end

  delete '/autos/:id/delete' do #delete action
    @auto = Auto.find_by_id(params[:id])
    @garage = @auto.garage
    @auto.delete
    @autos = @garage.autos
    erb :'autos/index'
  end


end
