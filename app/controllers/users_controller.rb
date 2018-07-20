class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/garages'
    end

    @user = User.find(parms[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/garages'
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/autos'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/garages'
  end

  get '/login' do

  end

  post '/login' do

  end

end
