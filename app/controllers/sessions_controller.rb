class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    cookies.delete(:remember_token)
    redirect_to root_url
  end

end
