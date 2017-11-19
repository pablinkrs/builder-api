class Escritorio
  include Mongoid::Document
  field :nombre, type: String
  field :fecha, type: Date
end
