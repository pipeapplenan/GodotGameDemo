extends Area2D

var motion = Vector2()

# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	translate(motion)

func random_move(x, y, d):
	motion.x = x
	motion.y = y
	$Sprite.rotation_degrees = d


func _on_fireflyer_area_entered(area):
	if area.name == "DodoHurtBox":
		queue_free()
