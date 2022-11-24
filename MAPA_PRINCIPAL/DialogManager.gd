extends Control

class Fala:
	var personagem
	var fala
	var img
	
	func _init(i_personagem, i_fala, i_img):
		personagem = i_personagem
		fala = i_fala
		img = i_img
		
		

enum TipoGrupoDialogo {animais, nutricao, livre}
var GrupoDialogo = {"animais": [], "nutricao": [], "livre": []}
var GrupoDialogoAtual = TipoGrupoDialogo.animais
var FalaAtual = -1

signal fechar_dialogo

func SetaFalas():
	
	var sprite_mae = load("res://MAPA_PRINCIPAL/mae_sprites/Laura.png")
	var sprite_filho = load("res://icon.png")
	
	# Falas Animais
	GrupoDialogo["animais"].append(Fala.new("Laura", "Oi Filho!", sprite_mae))
	GrupoDialogo["animais"].append(Fala.new("player", "Oi Mãe!", sprite_filho))
	GrupoDialogo["animais"].append(Fala.new("Laura", "Vai cuidar do gatinho!", sprite_mae))
	GrupoDialogo["animais"].append(Fala.new("player", "Não quero!", sprite_filho))
	GrupoDialogo["animais"].append(Fala.new("Laura", "Não quero saber!", sprite_mae))
	GrupoDialogo["animais"].append(Fala.new("player", "Mas mãeeee!", sprite_filho))
	GrupoDialogo["animais"].append(Fala.new("Laura", "Não quero saber!!!!", sprite_mae))
	GrupoDialogo["animais"].append(Fala.new("player", "Ta bom kk!", sprite_filho))
	
	
	
	GrupoDialogo["nutricao"].append(Fala.new("Laura", "Vai comer mlk!", sprite_mae))
	GrupoDialogo["nutricao"].append(Fala.new("player", "Ta bom caralho!", sprite_mae))
	
	GrupoDialogo["livre"].append(Fala.new("Laura", "Pd brincar agora otario", sprite_mae))
	GrupoDialogo["livre"].append(Fala.new("player", "Fecho entao maluco!", sprite_mae))

func _ready():
	visible = false
	SetaFalas()
	
func _process(delta):
	pass

func ProxFala():
	FalaAtual += 1
	if FalaAtual < GrupoDialogo[TipoGrupoDialogo.keys()[GrupoDialogoAtual]].size():
		$BAR_DOWN/SPRITE_PERSONAGEM.texture = GrupoDialogo[TipoGrupoDialogo.keys()[GrupoDialogoAtual]][FalaAtual].img
		$BAR_DOWN/DialogText.text = GrupoDialogo[TipoGrupoDialogo.keys()[GrupoDialogoAtual]][FalaAtual].fala
	else:
		FalaAtual = -1
		GrupoDialogoAtual += 1
		get_parent().get_node("INTERACTION_PANEL").emit_signal("InvertAnalogState")

# Quando o botão "Falar com a mãe" é chamado
func _on_INTERACTION_PANEL_InvertAnalogState():
	if visible == false:
		ProxFala()
	visible = !visible
	
func _on_PROX_FALA_pressed():
	ProxFala()
	pass # Replace with function body.
