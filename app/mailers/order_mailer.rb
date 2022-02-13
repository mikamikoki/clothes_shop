class OrderMailer < ApplicationMailer

  def order_mail(email)
  #mail = ENV['MAIL_ADDRESS']
  #@customer = customer
  #mail(to: @customer.email, subject: 'メールのタイトルがここに入ります')

  mail(
    from: 'system@example.com',
    to:   email,
    subject: '購入確定通知'
  )
  end
end
