class SessionsController < ApplicationController

  def new
  end

# If the user is not logged in, the page should show them a login link.
# If the user is logged in, the page should say, "hi, #{name}", and provide a logout link.
  def create
    # if the params[:name] does not exist or is empty, the user is redirected to a login page
    if !params[:name] || params[:name].empty?
      redirect_to '/sessions/new'
    else
      # if the user has provided a name, set the session[:name] equal to the params[:name]
      # then redirect to the root page, which is defined as 'application#welcome', where the user is greeted 
      session[:name] = params[:name]
      redirect_to '/'
    end
  end

  def destroy
    session.delete :name
    redirect_to '/'
  end

end
