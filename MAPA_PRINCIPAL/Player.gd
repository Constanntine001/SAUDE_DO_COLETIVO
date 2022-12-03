extends AnimatedSprite

export var pSpeed = 5;
export(NodePath) var _analogPath
var analogNode

func _ready():
	analogNode = get_node(_analogPath)
	pass

func _process(delta):
	var analogForce = analogNode.get_force()
	
	if analogForce.x == 0 || analogForce.y == 0:
		play("IDLE")
	elif analogForce.x < 0 && (abs(analogForce.x) > abs(analogForce.y)):
		play("WALK_WEST")
	elif analogForce.x > 0 && (abs(analogForce.x) > abs(analogForce.y)):
		play("WALK_EAST")
	elif analogForce.y < 0 && (abs(analogForce.y) > abs(analogForce.x)):
		play("WALK_SOUTH")
	elif analogForce.y > 0 && (abs(analogForce.y) > abs(analogForce.x)):
		play("WALK_NORTH")
	
	position.x += pSpeed * analogForce.x
	position.y -= pSpeed * analogForce.y
	pass
