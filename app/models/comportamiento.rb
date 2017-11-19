class Comportamiento
  include Mongoid::Document
  field :mes, type: String
  field :cantidad, type: Integer
end
