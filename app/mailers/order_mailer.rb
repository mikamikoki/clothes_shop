class OrderMailer < ApplicationMailer

  def order_mail
  @customer = params[:customer]
  mail(to: @customer.email, subject: 'メールのタイトルがここに入ります')

  mail(
    from: 'system@example.com',
    to:   'ENV[MAIL_ADDRESS]',
    subject: '購入確定通知'
  )

  end
end
