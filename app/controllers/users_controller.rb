class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(params['id'])
    user.avatar = params[:user][:avatar] # Assign a file like this, or
    user.save!
    redirect_to(edit_user_path(user))
  end

end
