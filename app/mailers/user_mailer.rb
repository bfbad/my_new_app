class UserMailer < ApplicationMailer
  default from: "brfergus2@gmail.com"

  def contact_form(email, name, message)
  @message = message
  mail(:from => email,
    :to => 'brfergus2@gmail.com',
    :subject=> "A new contact form message from #{name}")
  end
end
