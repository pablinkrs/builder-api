class Multimedia
  include Mongoid::Document

  field :nombre, type: String
  field :primera, type: String
  field :tipo, type: String
  field :ruta, type: String
  field :user_id, type: String

end
