class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(new_params)
      if user.save
        flash[:message] = "Welcome #{user.username}!"
        redirect_to(songs_path)
      else
        render :new
      end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def new_params
    params.require(:user).permit(:username, :password)
  end
end
