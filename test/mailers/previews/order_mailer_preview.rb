# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  def order_user
     order_user = OrderUser.new(name: "侍 太郎", message: "問い合わせメッセージ")

     OrderMailer.send_mail(order_user)
  end

end
