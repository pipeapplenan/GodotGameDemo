extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var next_scene = ""
var load_time = 15
onready var tween = $Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	tween.interpolate_property($ProgressBar, "value", 0, 100, load_time, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()
	pass # Replace with function body.

#func _on_Tween_tween_all_completed():
#	if next_screen !=null:
#		get_tree().change_scene("res://Scene/World1.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Tween_tween_all_completed():
	if next_scene !=null:
		get_tree().change_scene("res://Scene/Menu.tscn")
