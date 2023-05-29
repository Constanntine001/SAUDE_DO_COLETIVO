extends Node2D

#signal 

signal ratinho_dropou
signal wave

func _on_ground_body_entered(body):
	if body.name == "Ratinho" and $Base.freeze == false:
		var ratinhoCoord = $Ratinho.global_position
		
		emit_signal("ratinho_dropou", ratinhoCoord)
		queue_free()
		
func startWave():
	var ratinhoCoord = $wavePoint.global_position
	emit_signal("wave", ratinhoCoord)
	
