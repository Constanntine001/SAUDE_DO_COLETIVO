extends Node2D



func _ready():
	pass
	
func _process(delta):
	MoveOuCarinho()
	pass
	
func _input(event):
	pass

# [Função Move ou da Carinho]

"""
	Função que vai distinguir se o usuário vai dar carinho ou mover
	o gato. É chamada dentro do process()
"""

var holdTickCount = 0
var interactionStartPos = null
var carinho = false
func MoveOuCarinho():
	
	if mouseDentro and Input.is_action_pressed("leftMouseClick"):
		holdTickCount += 1
		print(holdTickCount)
		
		if(interactionStartPos == null):
			interactionStartPos = get_viewport().get_mouse_position()
			
		var distance = interactionStartPos.distance_to(get_viewport().get_mouse_position())
		
		if distance > 10:
			carinho = true
			
		if carinho:
			print("Você está acariciando o gatinho")
			return 0
		
		if(holdTickCount >= 30):
			print("Você está com o gato no colo")
	else:
		holdTickCount = 0
		interactionStartPos = null
		carinho = false

# [=========================]


# [Funções de mouse enter]

"""
	Funções que capturam se o mouse está dentro ou fora do escopo do gatinho
"""

var mouseDentro = false

func _on_area_2d_mouse_entered():
	mouseDentro = true
	print(mouseDentro)

func _on_area_2d_mouse_exited():
	mouseDentro = false
	print(mouseDentro)
	
# [======================]
