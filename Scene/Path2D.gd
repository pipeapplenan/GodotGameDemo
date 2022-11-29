extends Path2D


onready var follow = get_node("PathFollow2D")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var tween

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	
	tween = Tween.new()
	add_child(tween)
	

	tween.interpolate_property(follow, "unit_offset",
								0, 1, 8, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
								
	tween.set_repeat(true)
	tween.start()
	pass # Replace with function body.
