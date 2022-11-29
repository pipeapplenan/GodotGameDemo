extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Exit").get_node("CanvasLayer/Button").visible = true
	pass # Replace with function body.



func _on_Level1_pressed():
	TransitionScreen.change_scene("res://Scene/World1.tscn")
	pass # Replace with function body.


func _on_Level2_pressed():
	TransitionScreen.change_scene("res://Scene/World2.tscn")
	pass # Replace with function body.


func _on_Level3_pressed():
	TransitionScreen.change_scene("res://Scene/World3.tscn")
	pass # Replace with function body.


func _on_Boss_pressed():
	TransitionScreen.change_scene("res://Scene/World4.tscn")
	pass # Replace with function body.
