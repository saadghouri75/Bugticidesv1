class PropertyMailer < ApplicationMailer
  default from: 'admin@bugticide.com'
 
  def bid_informer(user,bid)
    @user = user
    @bid = bid
    mail(to: @user.email, subject: 'A bid has been made on your property.')
  end
end
