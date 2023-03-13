extends Sprite2D

signal sinal_interacao_on
signal sinal_interacao_off

enum TipoInteracao {falar, entrarFase}
@export var interacao: TipoInteracao
@export var extra : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.get_parent().name == "Player":
		emit_signal("sinal_interacao_on", interacao, extra)
	pass # Replace with function body.

func _on_Area2D_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if area.get_parent().name == "Player":
		emit_signal("sinal_interacao_off")
	pass # Replace with function body.
