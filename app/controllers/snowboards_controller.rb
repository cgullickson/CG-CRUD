class SnowboardsController < ApplicationController
  get '/snowboards' do
    if logged_in?
      @snowboards = Snowboard.all
      erb :'snowboard/index'
    else
      erb :'users/login'
    end
  end


  get '/snowboards/new' do
    if logged_in?
      erb :'snowboards/new'
    else
      erb :'users/login', locals: {message: "You don't have access, please login"}
    end
  end

  post '/snowboards' do
    if params.values.any? {|value| value == ""}
      erb :'snowboards/new'
    else
      user = User.find(session[:user_id])
      @snowboard = Snowboard.create(title: params[:title], budget: params[:budget], user_id: user.id)
      redirect to "/snowboards/#{@snowboard.id}"
    end
  end



end
