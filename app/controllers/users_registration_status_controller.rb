class UsersRegistrationStatusController < ApplicationController

  def update
    @user = User.find(params[:id])
    if @user.enter_status == false
      @user.update(enter_status: true)
      redirect_to user_path(@user.email)
    end
  end
end
