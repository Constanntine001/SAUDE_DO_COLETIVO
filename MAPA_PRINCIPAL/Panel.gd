extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.

func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	visible = true
	pass # Replace with function body.


func _on_Area2D_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	visible = false
	pass # Replace with function body.
