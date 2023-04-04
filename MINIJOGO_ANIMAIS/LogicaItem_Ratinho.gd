extends Node

# [REFERÊNCIAS GERAIS]

@onready var arrastaItem = get_parent().get_node("ArrastaItem")
@export var ratinhoSuspensoResource : Resource

# [------------------]


# [COMEÇA DRAG E ACABA DRAG]

"""
Oque acontece quando o drag do item inicia ou acaba
"""

func IniciaDrag():
	var ratinhoSuspenso = ratinhoSuspensoResource.new()
	#%CanvasLayer.add_child(ratinhoSuspenso)
	
func AcabaDrag():
	print("Bye!")

# [-------------------------]

func _ready():
	arrastaItem.connect("comecaDrag", IniciaDrag)
	arrastaItem.connect("acabouDrag", AcabaDrag)


func _process(delta):
	return 0
