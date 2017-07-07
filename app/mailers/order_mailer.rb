class OrderMailer < ApplicationMailer
  default from: 'noreplay@jungle.com'
  
  def order_email(order, current_user)
    @order = order
    @url = order_url(order, host:"localhost")
    @current_user = current_user
    mail(to: @order.email, subject: 'Your order with Jungle has been placed')
  end
  
end
