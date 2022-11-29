extends Area2D


const SPEED = 50
var velocity = Vector2()

func _physics_process(delta):
	match rotation_degrees:
		30.0:
			velocity.x = 3.5
			velocity.y = 2
		60.0:
			velocity.x = 2
			velocity.y = 3.5
		90.0:
			velocity.x = 0
			velocity.y = 4
		120.0:
			velocity.x = -2
			velocity.y = 3.5
		150.0:
			velocity.x = -3.5
			velocity.y = 2
	translate(velocity)


func _on_RedFire_body_entered(body):
	queue_free()
