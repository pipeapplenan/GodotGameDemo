extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Button_pressed():
	get_node("/root/Hud").get_node("CanvasLayer/Health").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Kills").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/KillNo").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Lv").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Level").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Right").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Left").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Attack").visible = false
	get_node("/root/Hud").get_node("CanvasLayer/Jump").visible = false
	get_node("/root/Exit").get_node("CanvasLayer/Button").visible = false
	get_node("/root/Hud").killNo = 0
	get_node("/root/Hud").level = 1
	get_node("/root/Hud").crystalNo = 0
	get_node("/root/Hud").health = 100
	get_tree().change_scene("res://Scene/Menu.tscn")
	
