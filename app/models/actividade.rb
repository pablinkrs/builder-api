class Actividade

  include Mongoid::Document
  has_many :entidade, :foreign_key=>"actividad_id"

  field :status, type: Integer
  field :institucion_id, type: String
  field :docente_id, type: String
  field :nivel_id, type: String
  field :asignatura_id, type: String
  field :nombre, type: String

end
