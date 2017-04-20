class StaticPagesController < ApplicationController
  
  def index
  end

  #manage contact form
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end


  def landing_page
  	@products = Product.limit(3)
  end
  
end
