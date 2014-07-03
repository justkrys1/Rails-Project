class UserMailer < ActionMailer::Base
  default from: "krys@purefishing.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newsletter.subject
  #
  def newsletter(editorial, user)
    @editorial = editorial
    @greeting = "You have opted to receive our newsletter. Included is the following new article: "
    @editorials = Editorial.all
    mail(:to => "<#{user}>", :subject => "Newsletter")#:bbc => ['daves_email', 'justkrys1@gmail.com'])
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact.subject
  #
  def contact
    @greeting = "Thankyou for your inquiry. We will be following up as soon as possible."

    mail to: "justkrys1@yahoo.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.editorial.subject
  #
  def editorial
    @greeting = "You have opted to receive our newsletter. Included is the following article as requested: "
    editorial = Editorial.first
    users = User.where(:newsletter => true)
    users.each do |user|
      UserMailer.editorial.deliver
    end
    redirect_to editorials_path, notice: 'Email was sent.'
  end

  def thankyou(user)
    @user = user
    mail(to: @user.email, subject: 'Thankyou for submitting your form.')
  end


end

