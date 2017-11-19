class Entidade
  include Mongoid::Document
  belongs_to :actividade

  field :archivo, type: String
  field :fecha_creacion, type: Date
  field :nombre, type: String
  field :tipo, type: String
  field :actividad_id, type: String, default: nil
  field :elementos, type: Hash
  field :elementos_nuevos, type: Hash
  field :idRe, type: String
  field :docStoryboard, type: Hash
end
