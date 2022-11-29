extends KinematicBody2D

enum {
	FLY,
	ATTACK_ONE,
	ATTACK_TWO,
	DIE
}

var state = FLY
var motion = Vector2.ZERO
var player = null
var hp = 10
var posX = 600

const FIREBALL = preload("res://Scene/RedFire.tscn")


func _ready():
	$BlueFire.visible = false


func _physics_process(delta):
	if hp > 0:
		if player != null:
			match state:
				FLY:
					motion.x = 0
					motion.y = -66
					fly_state(delta)
				ATTACK_ONE:
					motion = Vector2.ZERO
					attack_one_state(delta)
				ATTACK_TWO:
					motion.y = 0
					if posX > 500:
						motion.x = -130
					else:
						motion.x = 130
					attack_two_state(delta)
		else:
			$AnimationPlayer.play("Idle")
		motion = move_and_slide(motion)
	else:
		$AnimationPlayer.play("Die")

func fly_state(delta):
	$AnimationPlayer.play("Fly")

func attack_one_state(delta):
	$AnimationPlayer.play("AttackOne")
	
func attack_two_state(delta):
	$AnimationPlayer.play("AttackTwo")
	

func change_state():
	print("timer start")
	$Timer.start()


func _on_Timer_timeout():
	if state == FLY:
		$Timer.wait_time = 5
		state = ATTACK_ONE
	elif state == ATTACK_ONE:
		global_position.y = 280
		$Timer.wait_time = 5
		state = ATTACK_TWO
	else:
		posX = global_position.x
		if posX < 500:
			$Sprite.flip_h = true
			$BlueFire.rotation_degrees = 260
		else:
			$Sprite.flip_h = false
			$BlueFire.rotation_degrees = 0
		$Timer.wait_time = 3
		state = FLY
	$Timer.start()


func _on_PlayerDetectionArea_body_entered(body):
	if player == null:
		if body.name == "Dodo":
			player = body
			$PumpHP.visible = true
			$PumpHP.init()
			$PumpHP.update_hp(100)
			$Timer.start()


func _on_BossHurtBox_area_entered(area):
	if area.name == "DodoHitBox":
		var damage = get_node("/root/Hud").level*3 + 5
		hp -= damage
		$PumpHP.update_hp(hp)
		

func shoot_red_ball():
	var arr = [1,2,3,4,5]
	for i in arr:
		var fireball = FIREBALL.instance()
		get_parent().add_child(fireball)
		fireball.position = global_position
		fireball.rotation_degrees = 30 * i


func win_game():
	get_tree().change_scene("res://Scene/ExplosionFirwork.tscn")
