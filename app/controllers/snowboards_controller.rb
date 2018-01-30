class SnowboardsController < ApplicationController
  get '/snowboards' do
    if logged_in?
      @projects = Snowboard.all
      erb :'snowboard/index'
    else
      erb :'users/login'
    end
  end
