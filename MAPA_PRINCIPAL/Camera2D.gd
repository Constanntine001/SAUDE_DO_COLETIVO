extends Camera2D

@export var _playerPath: NodePath
@export var camOffset: Vector2

var playerNode

func _ready():
	playerNode = get_node(_playerPath)
	pass # Replace with function body.

func _process(delta):
	position = playerNode.position	+ camOffset
	pass
