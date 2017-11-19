class Plantilla
  include Mongoid::Document
  has_many :re, :foreign_key=>"plantilla_id"

  field :nombrePlantilla, type: String
  field :ruta, type: String
  field :rutaBody, type: String
  field :rutaFooter, type: String
  field :rutaHeader, type: String
  field :rutaImagenAudio, type: String
  field :rutaImg, type: String
end

# Plantilla.create({nombrePlantilla: "Plantilla 6 - Quimica", ruta: "public/plantillas/re_plantilla6/", rutaBody: "public/plantillas/re_plantilla6/img/plantilla_editor_plantilla1_body.png", rutaFooter: "plantillas/re_plantilla6/img/plantilla_editor_plantilla1_footer.png", rutaHeader: "plantillas/re_plantilla6/img/plantilla_editor_plantilla1_header.png", rutaImagenAudio: "public/plantillas/re_plantilla6/img/img_audio.png", rutaImg: "plantillas/re_plantilla6/img/re_leng7.png"})
