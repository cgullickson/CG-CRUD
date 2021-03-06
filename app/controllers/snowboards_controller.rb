class SnowboardsController < ApplicationController
  get '/snowboards' do
    if logged_in?
      @snowboards = Snowboard.all
      erb :'snowboards/index'
    else
      erb :'failure'
    end
  end


  get '/snowboards/new' do
    if logged_in?
      erb :'snowboards/new'
    else
      erb :'failure'
    end
  end

  post '/snowboards' do
    if params.values.any? {|value| value == ""}
      erb :'snowboards/new'
    else
      user = User.find(session[:user_id])
      @snowboard = Snowboard.create(name: params[:name], brand: params[:brand], price: params[:price], description: params[:description], contact: params[:contact], user_id: user.id)
      redirect to "/snowboards/#{@snowboard.id}"
    end
  end

  get '/snowboards/:id' do
    if logged_in?
      @snowboard = Snowboard.find(params[:id])
      erb :'snowboards/show'
    else
      erb :'failure'
    end
  end

  get '/snowboards/:id/edit' do
    if logged_in?
      @snowboard = Snowboard.find(params[:id])
      if @snowboard.user_id == session[:user_id]
       erb :'snowboards/edit'
      else
      erb :'failure'
      end
    else
      erb :'failure'
    end
  end

  patch '/snowboards/:id' do
    if params.values.any? {|value| value == ""}
      @snowboard = Snowboard.find(params[:id])
      erb :'snowboards/edit'
      redirect to "/snowboards/#{params[:id]}/edit"
    else
      @snowboard = Snowboard.find(params[:id])
      @snowboard.name = params[:name]
      @snowboard.brand = params[:brand]
      @snowboard.price = params[:price]
      @snowboard.description = params[:description]
      @snowboard.contact = params[:contact]
      @snowboard.save
      redirect to "/snowboards/#{@snowboard.id}"
    end
  end

  delete '/snowboards/:id/delete' do
    @snowboard = Snowboard.find(params[:id])
    if session[:user_id]
      @snowboard = Snowboard.find(params[:id])
      if @snowboard.user_id == session[:user_id]
        @snowboard.delete
        redirect to '/snowboards'
      else
        erb :'failure'
      end
    else
      erb :'failure'
    end
  end

end
