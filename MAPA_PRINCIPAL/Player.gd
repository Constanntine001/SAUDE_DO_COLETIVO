extends AnimatedSprite2D

@export var pSpeed = 5;
@export var _analogPath: NodePath
var analogNode

func _ready():
	analogNode = get_node(_analogPath)
	
	# Da load em qual personagem foi escolhido pelo player
	if GameManager.tipoSprite:
		sprite_frames = load("res://MAPA_PRINCIPAL/player_sprites/ANIM_CHARA.tres")
	else:
		sprite_frames = load("res://MAPA_PRINCIPAL/player_sprites/ANIM_CHARB.tres")

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
	
	position.x += pSpeed * analogForce.x * delta * 10
	position.y -= pSpeed * analogForce.y * delta * 10
	pass
