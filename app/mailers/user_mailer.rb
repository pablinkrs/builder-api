class UserMailer < ApplicationMailer
  default from: 'rquezada@ked.cl'

  def welcome_email(user)
    mail(to: user, subject: 'Reset password') do |format|
      texto = "Su contraseña nueva es: \n\n kolekio133"
      textohtml = "<h3>Su nueva contraseña es:</h3><br><p>kolekio133</p>"
      format.text { render :text => texto }
      format.html { render :text => textohtml }
    end
  end

end
