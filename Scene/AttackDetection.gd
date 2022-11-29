extends Area2D


var player

func can_see_player():
	return player != null


func _on_AttackDetection_body_entered(body):
	if(body.name == "Dodo"):
		player = body


func _on_AttackDetection_body_exited(body):
	if(body.name == "Dodo"):
		player = null
