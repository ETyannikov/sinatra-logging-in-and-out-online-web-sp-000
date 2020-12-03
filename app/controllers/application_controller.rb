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
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/account'
    else
      erb :error
    end
  end
  
  get '/error' do
    erb :error
  end
  
  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :account
    else
      erb :error
    end
  end

<<<<<<< HEAD

  get '/logout' do
=======
  get '/logout' 
>>>>>>> ed96cfa508a64eaf2d5baf16b8f7935a34a432fa
    session.clear
    redirect to '/'
  end


end

