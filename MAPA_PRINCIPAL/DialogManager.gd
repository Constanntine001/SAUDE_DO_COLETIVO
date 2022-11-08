extends Control



func _ready():
	visible = false

# Quando o botão "Falar com a mãe" é chamado
func _on_INTERACTION_PANEL_InvertAnalogState():
	visible = true
