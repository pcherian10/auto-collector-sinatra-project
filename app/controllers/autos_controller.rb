class AutosController < ApplicationController

  get "/autos" do
    redirect_if_not_logged_in
    @autos = Auto.all
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
    Auto.create(params)
    redirect "/autos"
  end
end
