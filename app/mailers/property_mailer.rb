class PropertyMailer < ApplicationMailer
  default from: 'admin@bugticide.com'
 
  def bid_informer(user,bid)
    @user = user
    @bid = bid
    mail(to: @user.email, subject: 'A bid has been made on your property.')
  end

  def book_appointment(user, availability, message)
  	@user = user
  	@availability = availability
  	@message = message
  	mail(to: 'saad_ghouri75@yahoo.com', subject: 'Request for an appointment')
  end

end
