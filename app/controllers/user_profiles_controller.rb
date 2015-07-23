class UserProfilesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile || @user.create_profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to user_profile_path(current_user)
    else
      render 'edit'
    end
  end

  protected

  def profile_params
    params.require(:profile).permit(:name)
  end

end
