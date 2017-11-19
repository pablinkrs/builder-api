class LoginController < ApplicationController

  def login
    datos = params
    begin
      puts "++++++++++++++++++++++++++++++++++++++++++++"
      puts datos
      usuario = User.find_by(email: datos["email"])
      if usuario.activado
        if usuario.valid_password?(datos["password"])
          puts "usuario valido"
          # UserMailer.welcome_email(datos["email"]).deliver_now
          usuario.update(authentication_token: SecureRandom.uuid.gsub(/\-/,''))
          render json: {usuario: usuario, sign_in: "0"}
        else
          puts "usuario no valido"
          render json: {sign_in: "1"}
        end
      else
        render json: {sign_in: "3"}
      end

    rescue => ex
      render json: {sign_in: "2"}
    end
  end

  def resetPassword
    datos = params
    usuario = User.find_by(email: datos["email"])
    usuario.update({password: "kolekio133", password_provisoria: true})
    UserMailer.welcome_email(datos["email"]).deliver_later
  end

  def login_perfil
    datos = params
    begin
      usuario = User.find_by(id: datos["email"])
      if usuario.activado
        if usuario.valid_password?(datos["password"])
          puts "usuario valido"
          usuario.update(authentication_token: SecureRandom.uuid.gsub(/\-/,''))
          render json: {usuario: usuario, sign_in: "0"}
        else
          puts "usuario no valido"
          render json: {sign_in: "1"}
        end
      else
        render json: {sign_in: "3"}
      end

    rescue => ex
      render json: {sign_in: "2"}
    end
  end

end
