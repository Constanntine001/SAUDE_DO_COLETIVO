extends Camera2D

export(NodePath) var _playerPath
export(Vector2) var camOffset

var playerNode

func _ready():
	playerNode = get_node(_playerPath)
	pass # Replace with function body.

func _process(delta):
	position = playerNode.position	+ camOffset
	pass
