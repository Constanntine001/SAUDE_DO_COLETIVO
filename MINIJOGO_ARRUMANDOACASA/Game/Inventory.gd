extends ItemList



# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_inventory_button_down():
	if not visible:
		visible = true
	else:
		visible = false
	pass # Replace with function body.
