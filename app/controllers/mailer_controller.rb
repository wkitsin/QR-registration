class MailerController < ApplicationController

  def create
    # users = User.all
      @user = User.find_by_email('wk.sin@imv.com.sg')
      image_name = @user.email.gsub(/[^0-9A-Za-z]/, '-')
      UsersMailer.send_mail_to_all_guest(@user,image_name).deliver_later
  end
end
