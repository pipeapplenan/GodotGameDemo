extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Crystal_body_entered(body):
	if body.name == "Dodo":
		$AnimationPlayer.play("Collected")
		get_node("/root/Hud").crystalNo += 1
