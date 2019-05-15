require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    
    @user = User.find_by('username' => params[:username])
    session[:user_id] == @user.id
    binding.pry
    redirect to '/account'

  end

  get '/account' do
    @user = User.find_by_id(session[:user_id])
    
    if Helpers.is_logged_in?
      erb :account
    end
  end

  get '/logout' do

  end


end

