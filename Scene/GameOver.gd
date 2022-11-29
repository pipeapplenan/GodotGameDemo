extends Node2D


func _ready():
	get_node("/root/Hud").get_node("CanvasLayer/Health").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Right").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Left").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Attack").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Jump").visible = false



