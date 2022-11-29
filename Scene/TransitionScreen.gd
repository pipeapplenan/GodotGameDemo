extends CanvasLayer

func change_scene(target: String) -> void:
	$AnimationPlayer.play("fade_to_norm")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(target)
	
	$AnimationPlayer.play_backwards("fade_to_norm")
