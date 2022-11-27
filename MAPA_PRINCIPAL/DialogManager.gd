extends Control

class Personagem:
	var nome
	var img
	
	func _init(i_nome, i_img):
		nome = i_nome
		img = i_img

class Fala:
	var personagem
	var fala
	
	func _init(i_personagem, i_fala):
		personagem = i_personagem
		fala = i_fala

var dialogos = {"intro_animais": [], "animais": [], "animais_nutricao": [], "nutricao": [], "nutricao_livre": [], "livre": []}
var FalaAtual = -1

signal fechar_dialogo

func AdicionaFalas(grupo, personagem, fala):
	dialogos[grupo].append(Fala.new(personagem, fala))
	pass
	
# Função que monta todas as falas do game
func SetaFalas():
	var mae = Personagem.new("Laura", load("res://MAPA_PRINCIPAL/mae_sprites/Laura.png"))
	var player = Personagem.new(GameManager.nomeJogador, load("res://icon.png"))

	AdicionaFalas("intro_animais", mae, "Oi Filho")
	AdicionaFalas("intro_animais", mae, "Vai cuidar do gatinho por favor")
	AdicionaFalas("intro_animais", player, "Ok mãe, te amo")
	
	AdicionaFalas("animais", mae, "Filho, já te disse, vai cuidar do gatinho!")
	AdicionaFalas("animais", player, "Ok mae estou indo!")
	
	
func _ready():
	visible = false
	SetaFalas()
	
func ProxFala():
	FalaAtual += 1
	if FalaAtual < dialogos[GameManager.TipoObjetivo.keys()[GameManager.objetivo]].size():
		$BAR_DOWN/SPRITE_PERSONAGEM.texture = dialogos[GameManager.TipoObjetivo.keys()[GameManager.objetivo]][FalaAtual].personagem.img
		$BAR_DOWN/DialogText.text = dialogos[GameManager.TipoObjetivo.keys()[GameManager.objetivo]][FalaAtual].fala
		$BAR_DOWN/NomePersonagem.text = dialogos[GameManager.TipoObjetivo.keys()[GameManager.objetivo]][FalaAtual].personagem.nome
	else:
		GameManager.FinalizaFala()
		FalaAtual = -1 # Reseta o contador de falas
		get_parent().get_node("INTERACTION_PANEL").emit_signal("InvertAnalogState") # Desliga o sistema de dialogo

# Quando o botão "Falar com a mãe" é chamado
func _on_INTERACTION_PANEL_InvertAnalogState():
	if visible == false:
		ProxFala()
	visible = !visible
	
func _on_PROX_FALA_pressed():
	ProxFala()
	pass # Replace with function body.
