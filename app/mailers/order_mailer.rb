class OrderMailer < ApplicationMailer
  default from: 'brfergus2@gmail.com'

  def order_email(user, product)
    @user = user
    @product = product
    mail(to: @user.email, subject: "Successful Order from Brandon's Bike Shop")
  end
end
