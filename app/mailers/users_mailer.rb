class UsersMailer < ApplicationMailer
  default from: 'leaveappimv@gmail.com'

  def send_mail_to_all_guest(user,image_url)
    # @user = User.find_by_email('wk.sin@imv.com.sg')
    @user = user
    attachments["#{image_url}.png"] = File.read("public/qr-codes-1526377825/#{image_url}.png")
    mail(to: @user.email, subject: 'Buro Turns Three Invitation')
  end
end
