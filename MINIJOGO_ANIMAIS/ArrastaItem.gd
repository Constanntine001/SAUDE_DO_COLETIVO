extends Node


# [REFERÊNCIAS GERAIS]

"""Node pai desse script (TextureRect nesse caso)"""
@onready var node : TextureRect = get_parent()

# [------------------]

# [FUNC MOUSE SAIU E ENTROU]

"""
	Pega se o mouse entrou ou saiu
	do objeto
"""

var estaDentro = false

func MouseEntrou():
	estaDentro = true
	
func MouseSaiu():
	estaDentro = false

# [----------------------------]

# [FUNC PROCESSA MOVIMENTO ITEM]

"""
	Função que fica dentro do _process para verificar se o mouse
	está dentro e o botão está clicado para mover o item na tela
"""

signal comecaDrag
signal acabouDrag

var dragging = false #Só uma variável de controle pro evento não ficar chamando toda hora quando soltar o mouse
func ChecaDrag(event):
	if event.is_action_pressed("leftMouseClick") and estaDentro:
		dragging = true
		emit_signal("comecaDrag")
		node.modulate.a = 0.5
	elif event.is_action_released("leftMouseClick") and dragging:
		dragging = false
		emit_signal("acabouDrag")
		node.modulate.a = 1

# [----------------------------]


func _process(delta):
	#print(estaDentro)
	return 0

func _input(event):
	ChecaDrag(event)

func _ready():
	node.connect("mouse_entered", MouseEntrou)
	node.connect("mouse_exited", MouseSaiu)
