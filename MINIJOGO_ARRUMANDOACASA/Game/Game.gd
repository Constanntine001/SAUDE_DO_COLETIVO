extends Node2D


var spawmCozinha = [
	Vector2(1267, 739),
	Vector2(1171, 499),
	Vector2(1332, 322),
	Vector2(1092,  18),
	Vector2(1420, 794),
	Vector2(1444, 650)
]
var spawmSala = [
	Vector2(210, 410),
	Vector2( 86, 307),
	Vector2( 56, 467),
	Vector2(213, 577),
	Vector2(183, 667),
	Vector2(363, 797)	
]
var spawmQuarto = [
	Vector2(823, 817),
	Vector2(623, 597),
	Vector2(783, 317),
	Vector2(843, 487),
	Vector2(969, 547),
	Vector2(899, 747)
]
var itemSprites = [
	preload("res://MINIJOGO_ARRUMANDOACASA/Game/Images/Toys/Glass.png"),
	preload("res://MINIJOGO_ARRUMANDOACASA/Game/Images/Toys/Plant.png"),
	preload("res://MINIJOGO_ARRUMANDOACASA/Game/Images/Toys/popsicle.png"),
	preload("res://MINIJOGO_ARRUMANDOACASA/Game/Images/Toys/Skull.png"),
	preload("res://MINIJOGO_ARRUMANDOACASA/Game/Images/Toys/Sunglasses.png"),
	preload("res://MINIJOGO_ARRUMANDOACASA/Game/Images/Toys/PB.png")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_items(spawmCozinha, itemSprites)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_items(spawnPoints, spriteList):
	for spawmpoint in spawnPoints:
		var cords = spawmpoint
		
		var randSpriteIndex = randi() % spriteList.size()
		var itemSprite = Sprite2D.new()
		
		itemSprite.texture = itemSprites[randSpriteIndex]
		itemSprite.position = cords
		add_child(itemSprite)
		
		
