extends Label
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Tween.interpolate_property(
		self, "percent_visible",
		0, 1, 15, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$Tween.start()

		
	
 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

 # Replace with function body.
