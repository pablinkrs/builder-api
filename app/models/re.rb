class Re
  include Mongoid::Document

  belongs_to :plantilla

  field :archivosGenerados, type: String
  field :asignatura_id, type: String
  field :docente_id, type: String
  field :estructura, type: String
  field :institucion_id, type: String
  field :nivel_id, type: String
  field :nombreRe, type: String
  field :plantilla_id, type: String
  field :rutaReAssets, type: String
  field :herramientas_re, type: String
  field :incluidos, type: String
  field :docStoryboard, type: Hash
end
