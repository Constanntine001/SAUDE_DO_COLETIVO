extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Logica para mover a camera entre as tres posiçoes, no futuro ao inves de apenas 
#teleportar a camera podemos fazer uma trisição.
func _on_l_button_button_down():
	if offset.x > 241:
		offset.x -= 500
	else:
		offset.x = 1241 
		
	pass # Replace with function body.


func _on_r_button_button_down():
	if offset.x < 1241:
		offset.x += 500
	else:
		offset.x = 241 
		
	pass # Replace with function body.
