extends Node

# [REFERÊNCIAS GERAIS]

@onready var arrastaItem = get_parent().get_node("ArrastaItem")
@onready var ratinhoSuspensoResource : PackedScene = preload("res://MINIJOGO_ANIMAIS/ratinho_suspenso.tscn")
@onready var ratinhoGroundResource : PackedScene = preload("res://MINIJOGO_ANIMAIS/ratinho.tscn")
@onready var ratinhoWaveResource : PackedScene = preload("res://MINIJOGO_ANIMAIS/area_wave.tscn")

# [------------------]


# [COMEÇA DRAG E ACABA DRAG]

"""
Oque acontece quando o drag do item inicia ou acaba
"""

var nRatinho
var dragging = false
func IniciaDrag():
	if get_tree().get_nodes_in_group("brinquedo_rato").size() <= 0 and nRatinho == null:
		nRatinho = ratinhoSuspensoResource.instantiate()
		add_child(nRatinho)
		nRatinho.connect("ratinho_dropou", RatinhoCaiu)
		nRatinho.connect("wave", RatinhoWave)
		dragging = true
	
func AcabaDrag():
	#nRatinho.queue_free()
	if nRatinho != null:
		nRatinho.get_node("Base").freeze = false
		dragging = false

# [-------------------------]

# [RatinhoCaiu]

"""
	Função que define oque acontece quando o ratinho cai no chão
"""

var ratinhoGround
func RatinhoCaiu(ratinhoCoord):
	var rect : Rect2 = Rect2(%MovementArea.global_position.x, %MovementArea.global_position.y, %MovementArea.global_scale.x, %MovementArea.global_scale.y)

	# Se o ratinho caiu dentro da area que ele pode cair
	if rect.has_point(ratinhoCoord) and get_tree().get_nodes_in_group("brinquedo_rato").size() <= 0:
		if ratinhoWave != null:
			ratinhoWave.queue_free()
		ratinhoGround = ratinhoGroundResource.instantiate()
		get_tree().current_scene.add_child(ratinhoGround)
		ratinhoGround.global_position = ratinhoCoord

# [------------]

# [Ratinho Wave]

"""
	Função que define oque acontece quando o player
	usa a função de wave
"""

var ratinhoWave
func RatinhoWave(ratinhoCoord):
	var rect : Rect2 = Rect2(%MovementArea.global_position.x, %MovementArea.global_position.y, %MovementArea.global_scale.x, %MovementArea.global_scale.y)
	
	#...Se tiver um area wave destroi e cria outro se não tiver só cria um area wave
	# Sempre que o ratinho cair destruir o area_wave	
	if rect.has_point(ratinhoCoord):
		var groupNodes = get_tree().get_nodes_in_group("area_wave")
		if groupNodes.size() > 0:
			for item in groupNodes:
				item.queue_free()
		ratinhoWave = ratinhoWaveResource.instantiate()
		get_tree().current_scene.add_child(ratinhoWave)
		ratinhoWave.global_position = ratinhoCoord


			
	
# [------------]	

func _ready():
	arrastaItem.connect("comecaDrag", IniciaDrag)
	arrastaItem.connect("acabouDrag", AcabaDrag)


func _process(delta):
	if dragging:
		nRatinho.position = get_viewport().get_mouse_position()
