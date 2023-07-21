extends Node

# [REFERÊNCIAS GERAIS]

@onready var arrastaItem = get_parent().get_node("ArrastaItem")
@onready var racaoResource : PackedScene = preload("res://MINIJOGO_ANIMAIS/racao.tscn")

# [------------------]

# [COMEÇA DRAG E ACABA DRAG]

"""
Oque acontece quando o drag do item inicia ou acaba
"""

var nRacao
var dragging = false
func IniciaDrag():
	if get_tree().get_nodes_in_group("racao").size() <= 0 and nRacao == null:
		nRacao = racaoResource.instantiate()
		add_child(nRacao)
		dragging = true
	
func AcabaDrag():
	if nRacao != null:
		dragging = false
		var rect : Rect2 = Rect2(%MovementArea.global_position.x, %MovementArea.global_position.y, %MovementArea.global_scale.x, %MovementArea.global_scale.y)
		
		var feedArea = %PotesComida.get_node("FeedArea")
		var feedAreaRect : Rect2 = Rect2(feedArea.global_position.x, feedArea.global_position.y, feedArea.global_scale.x, feedArea.global_scale.y)

		if feedAreaRect.has_point(nRacao.position):
			%PotesComida.encherPote()
			nRacao.queue_free()
		elif !rect.has_point(nRacao.position):
			nRacao.queue_free()

# [-------------------------]

func _ready():
	arrastaItem.connect("comecaDrag", IniciaDrag)
	arrastaItem.connect("acabouDrag", AcabaDrag)
	
func _process(delta):
	if dragging:
		nRacao.position = get_viewport().get_mouse_position()
