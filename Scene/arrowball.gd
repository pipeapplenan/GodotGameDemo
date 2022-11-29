extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const FIREBALL_SPEED = 100

func _ready():
	set_process(true)
	
func _process(delta):
	var speed_x = 0
	var speed_y = 1
	var motion = Vector2(speed_x, speed_y) * FIREBALL_SPEED
	set_global_position(get_global_position() + motion * delta)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
