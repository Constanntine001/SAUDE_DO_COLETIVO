extends Node

# Salva o node do pepino para movimentar ele
@onready var pepino : Node2D = %PEPINO

# Posição que o pepino vai ir
var targetPos : Vector2 = Vector2(0, 0)

# Se o pepino está sendo carregado pelo jogador
var mouseInside = false
var dragging = false

func _ready():
	_on_timer_timeout()

func _process(delta):
	if mouseInside and Input.is_action_pressed("leftMouseClick"):
		dragging = true
	elif dragging and !Input.is_action_pressed("leftMouseClick"):
		dragging = false
	
	if dragging:
		pepino.position = get_viewport().get_mouse_position()
		targetPos = pepino.position
	else:
		pepino.position = pepino.position.lerp(targetPos, delta * pepino.get_meta("velocidade"))
		
func _on_timer_timeout():
	targetPos = Vector2(
	randi_range(%MovementArea.position.x, %MovementArea.position.x + %MovementArea.scale.x),
	randi_range(%MovementArea.position.y, %MovementArea.position.y + %MovementArea.scale.y)
	)

# Se o mouse entrar na área do pepino
func _on_area_2d_mouse_entered():
	mouseInside = true

# Se o mouse sair da área do pepino
func _on_area_2d_mouse_exited():
	mouseInside = false
