extends Sprite

export var pSpeed = 5;
export(NodePath) var _analogPath
var analogNode

func _ready():
	analogNode = get_node(_analogPath)
	pass

func _process(delta):
	var analogForce = analogNode.get_force()
	
	position.x += pSpeed * analogForce.x
	position.y -= pSpeed * analogForce.y
	pass
