class Kedito
  include Mongoid::Document
  field :nombre, type: String
  field :telefono, type: BigDecimal
end
