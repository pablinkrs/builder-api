class Herramientas
  include Mongoid::Document

  field :nombre, type: String
  field :rutaCss, type: String
  field :rutaJs, type: String
  field :conf, type: String
  field :predeterminada, type: String
end

=begin

粨�拦.Ꞙꬺg첩镩ᶇ^�zzzV슪kz{Z㦫r^嬭ຫzb)⩡jȝᩭ{huꞖW硫-햫u隲)ݺ˫髝zǞzV藝4r槶맊jkzʫ5ץN竲險笹ם醚娦淧姞ኧም⫮�媚u랆ڬʚ,鬜嗭jYꝪڪ祢
ᩇ뺹bnꝺױ拞◜ꧧ6륢ʛ�Ѫ,⩨ꧭjf⺸炷첉赬mᗫzY^v箙魢ǥy˫⫞u靡랝Ț槧娠驚抢⩚䛞抮媢ͧhzyh㭬r饩ʞiȧu隲#j涬zٚዚ嫜⻞嫚�x꫺b)⩲ꊞr'絩좻(~ܚ�j먹؜귨ꊨ�ꙨWnචxƤz祲楊w%맯z뢢w쵢譩見澐 


conf = '[{"id":"","size":{"col":20,"row":20},"palabras":[{"cordenadaCol":5,"cordenadaRow":7,"horientacion":"H","palabra":0,"pregunta":"¿Que dia es hoy si mañana es Sabado?","respuesta":"viernes"},{"cordenadaCol":9,"cordenadaRow":7,"horientacion":"V","palabra":1,"pregunta":"¿Cual es el mes 11 del año?","respuesta":"noviembre"}],"ejercicio":""}]'

predeterminada = '[{"balanza":"img/balanza/balanza.png","referencia":"img/balanza/referencia.png","fondo":"img/fondo_balanza.png","receptores":{"der":"img/balanza/balanza-cuadro.der.png","izq":"img/balanza/balanza-cuadro.izq.png"},"graduacion":"img/balanza/linea_central.png","arrastres":["img/balanza/pesa.png"]}]'

Herramientas.create({nombre: "Crucigrama", rutaCss: "librerias_pruebas/css/50_crucigrama.css", rutaJs: "librerias_pruebas/js/50_crucigrama.js", conf: conf})
=end
