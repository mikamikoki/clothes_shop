class OrderMailer < ApplicationMailer

  def order_mail
  mail = ENV['MAIL_ADDRESS']
  @customer = params[:customer]
  mail(to: @customer.email, subject: 'メールのタイトルがここに入ります')

  mail(
    from: 'system@example.com',
    to:   mail,
    subject: '購入確定通知'
  )
  end
end
