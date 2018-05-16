class UsersController < ApplicationController

  def show
    @user = User.find_by_email(params[:email])
  end

  def index
    @users = User.all.order(:email)

    respond_to do |format|
      format.html
      format.csv { send_data @users.as_csv, filename: "guest-list-#{Date.today}.csv" }
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = "#{user.email} successfully created"
      redirect_to user_path(user.email)
    else
      flash[:error] = 'failed to create user'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
