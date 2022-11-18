extends Panel

# Painel de interação com NPCs e minijogos
signal InvertAnalogState

# Ao iniciar a cena fica invisivel
func _ready():
	visible = false

# Quando jogador entra na área da mãe este painel aparece
func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	visible = true

#Ao sair da área da mãe o painel desaparece
func _on_Area2D_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	visible = false

# Quando o botão de interação da mãe é clicado painel interativo desaparece
# e analog desaparece e é desativado
func _on_Button_pressed():
	visible = false
	emit_signal("InvertAnalogState") # Emite sinal para o Analog se desligar ou ligar
	
