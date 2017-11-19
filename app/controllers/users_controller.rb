class UsersController < ApplicationController
  def index
    @usuarios = User.where(activado: true).order
    render json: @usuarios
  end

  def find_id
    @usuarios = User.find(params[:id])
    render json: {usuarios: @usuarios, nombrePerfil: @usuarios.perfil.nombre, tipoperfil: @usuarios.perfil.nombrecorto}
  end
  def find_field
    @usuarios = User.where(params["datos"])
    render json: @usuarios
  end

  def create
    @usuarios = User.create(email: params["email"], password: params["password"], datos: params["datos"], perfil_id: params["perfil_id"], padre_id: params["padre_id"])
    render json: @usuarios
  end


  def update
    usuarios = User.find_by(id: params["id"])
    if(params["datos"]["password"] != nil)
      usuarios.update({password: params["datos"]["password"], password_provisoria: false})
    end
    render json: usuarios.update({perfil_id: params["datos"]["perfil_id"],padre_id: params["datos"]["padre_id"],datos: params["datos"]["datos"]})
  end

  def updateperfiles
    usuario = User.find(params[:id])
    usuario.update({datos: {nombre: params[:datos]["nombre"], apellido: params[:datos]["apellido"], rutaAvatar: params[:datos]["rutaAvatar"]}})
  end

  def updateperfilespassword
    usuario = User.find(params[:id])
    usuario.update({password: params[:password], password_provisoria: false})
  end

  def destroy
    @usuarios = User.find(params["id"])

    render json: @usuarios.update(activado: false)
  end

  def buscaxtipoperfil
    idPerfil = Perfil.usuariosxperfil(params["tipoperfil"])
    p idPerfil
    p "***+*********+********"
    datos = User.where({perfil_id: idPerfil, activado: true})
    p datos
    render json: datos
  end


end
