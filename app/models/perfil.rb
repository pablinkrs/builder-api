class Perfil
  include Mongoid::Document
  has_many :user, :foreign_key=>"perfil_id"

  field :nombre, type: String
  field :nombrecorto, type: String

  def self.usuariosxperfil(tipoperfil)
    idperfil = Perfil.find_by(nombrecorto: tipoperfil)[:id].to_s
    # usuarios = User.find_by(perfil_id: idperfil._id)
  end
end
