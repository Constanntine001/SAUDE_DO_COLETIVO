extends Node

#[REFERÊNCIAS GERAIS]

# Salva o node do pepino(gato) para movimentar ele
@onready var pepino : Node2D = get_parent()

#[==========================]


#[ESCOPO PegaPosicaoAleatoria()]

"""
	Função que pega uma posição aleatória dentro do objeto "MovementArea",
	servirá para quando o pepino estiver em modo "Idle"
"""

func PegaPosicaoAleatoria() -> Vector2:
	var posicaoAleatoria = Vector2(
	randi_range(%MovementArea.position.x, %MovementArea.position.x + %MovementArea.scale.x),
	randi_range(%MovementArea.position.y, %MovementArea.position.y + %MovementArea.scale.y)
	)
	
	return posicaoAleatoria
#[=============================]

#[ESCOPO MoveGato()]

"""
	Função e funções que fazem o pepino se mexer para algum lugar
"""

@export var velocidadeDeMovimentoPadrao : float = 10.0
var velocidadeDeMovimento = 10.0
var seMovendo : bool = false
var seMovePara : Vector2 = Vector2.ZERO

signal finalizouMovimento

func MoveGato(pos : Vector2, input_velocidade = 0):
	if input_velocidade > 0:
		velocidadeDeMovimento = input_velocidade
	else:
		velocidadeDeMovimento = velocidadeDeMovimentoPadrao
	
	seMovePara = pos
	seMovendo = true
	await finalizouMovimento
	seMovendo = false

func _MoveGatoProcessHandler(delta):
	if seMovendo:
		pepino.global_position = pepino.global_position.move_toward(seMovePara, delta * velocidadeDeMovimento)
		if pepino.global_position == seMovePara:
			emit_signal("finalizouMovimento")
	
	
#[=================]

func _process(delta):
	_MoveGatoProcessHandler(delta)
	pass

# Se o pepino está sendo carregado pelo jogador
#var mouseInside = false
#var dragging = false

#func _ready():
#	_on_timer_timeout()

#func _process(delta):
#	if mouseInside and Input.is_action_pressed("leftMouseClick"):
#		dragging = true
#	elif dragging and !Input.is_action_pressed("leftMouseClick"):
#		dragging = false
#	
#	if dragging:
#		pepino.position = get_viewport().get_mouse_position()
#		targetPos = pepino.position
#	else:
#		pepino.position = pepino.position.lerp(targetPos, delta * pepino.get_meta("velocidade"))
		
#func _on_timer_timeout():
	# Vai ter uma função aqui quando eu lembrar rsrs
#	pass

# Se o mouse entrar na área do pepino
#func _on_area_2d_mouse_entered():
#	mouseInside = true

# Se o mouse sair da área do pepino
#func _on_area_2d_mouse_exited():
#	mouseInside = false
