class AddonsController < ApplicationController
  get '/snowboards/:id/addons/new' do
    if logged_in?
      @snowboard = Snowboard.find(params[:id])
      if @snowboard.user_id == session[:user_id]
      erb :'addons/new'
      else
        erb :'failure'
      end
    else
      erb :'failure'
    end
  end

  post '/snowboards/:id' do
    if params.values.any? {|value| value == ""}
      @snowboard = Snowboard.find(params[:id])
      erb :'addons/new'
    else
      @snowboard = Snowboard.find(params[:id])
      @addon = Addon.new(name: params[:name], kind: params[:kind])
      @addon.save
      @snowboard.addons << @addon
      redirect to "/snowboards/#{@snowboard.id}"
    end
  end

  delete '/snowboards/:id/addons/:addon_id/delete' do
    @snowboard = Snowboard.find(params[:id])
    @addon = Addon.find(params[:addon_id])
    if logged_in?
      @snowboard = Snowboard.find(params[:id])
      if @snowboard.user_id == session[:user_id]
        @addon = Addon.find(params[:addon_id])
        @addon.delete
        redirect to "/snowboards/#{@snowboard.id}"
      else
        redirect to "/snowboards/#{@snowboard.id}"
      end
    else
      erb :'failure'
    end
  end

end
