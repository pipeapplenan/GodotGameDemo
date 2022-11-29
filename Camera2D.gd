extends Camera2D

var right = true

func _process(delta):
	if right:
		position.x += 500 * delta
	else: 
		position.x -= 500 * delta



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	right = !right # Replace with function body.
