extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(position.x)
	pass


func _on_button_r_button_down():
	if position.x > 1000:
		position.x = 240
	else:
		position.x += 500
	


func _on_button_l_button_down():
	#Todo Corrigir bug de voltar um comodo a mais.
	if position.x < 240:
		print("true")
		position.x = 1240
	else:
		position.x -= 500 
