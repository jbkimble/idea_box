class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])

    if @user == nil
      render :new
    else
      @user.authenticate(params[:password])
      flash[:success] = "Succesfull logged in!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Successfully logged out!"
    redirect_to login_path
  end

end
