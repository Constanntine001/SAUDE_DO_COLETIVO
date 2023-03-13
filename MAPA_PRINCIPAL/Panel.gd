extends Panel

# Painel de interação com NPCs e minijogos
signal InvertAnalogState
signal InvertDialogState

var interacaoAtual
var interacaoExtra

# Ao iniciar a cena fica invisivel
func _ready():
	visible = false

# Quando o botão de interação da mãe é clicado painel interativo desaparece
# e analog desaparece e é desativado
func _on_Button_pressed():
	visible = false
	if interacaoAtual == 0:
		emit_signal("InvertAnalogState") # Emite sinal para o Analog se desligar ou ligar
		emit_signal("InvertDialogState") # Emite sinal para o Dialogo se desligar ou ligar
	elif interacaoAtual == 1:
		match interacaoExtra:
			"Animais":
				get_tree().change_scene_to_file("res://MINIJOGO_ANIMAIS/animais.tscn")
		
		#emit_signal("InvertAnalogState")
	
func _on_npc_sinal_interacao_off():
	visible = false
	pass # Replace with function body.

func _on_npc_sinal_interacao_on(interacao, extra):
	interacaoAtual = interacao
	interacaoExtra = extra
	if interacao == 0:
		$Button.text = "Falar com a mãe"
	elif interacao == 1:
		$Button.text = "Jogar " + extra
	visible = true
	pass # Replace with function body.
