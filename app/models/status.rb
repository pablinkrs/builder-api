class Status
  include Mongoid::Document
  field :nombre, type: String
  field :cantidad, type: Integer
end
