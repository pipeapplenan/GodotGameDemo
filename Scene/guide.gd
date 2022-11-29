extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_guide_body_entered():
	$Label.visible = true
	pass # Replace with function body.


func _on_guide_body_exited():
	$Label.visible = false
	pass # Replace with function body.
