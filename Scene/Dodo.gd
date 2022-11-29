extends KinematicBody2D


const UP = Vector2(0, -1)

enum {
	MOVE,
	ATTACK
}

var state = MOVE
var motion = Vector2()
var velocity_x = 0
var health = 100

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true


func _physics_process(delta):
	if health > 0:
		match state:
			MOVE:
				move_state(delta)
				
			ATTACK:
				attack_state(delta)
	else:
		$AnimationPlayer.play("Dead")
	
	
func move_state(delta):
	if is_on_wall():
		motion.y += 3
	else:
		motion.y += 10
		
	velocity_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if is_on_floor():
		motion.x = velocity_x * 200
	else:
		motion.x = lerp(motion.x, velocity_x * 200, 0.1)
	
	if motion.x != 0:
		animationTree.set("parameters/Idle/blend_position", motion.x)
		animationTree.set("parameters/Run/blend_position", motion.x)
		animationTree.set("parameters/Attack/blend_position", motion.x)
		if is_on_floor():
			animationState.travel("Run")
		else:
			animationState.travel("Idle")
	else:
		animationState.travel("Idle")
		
	if is_on_floor() || is_on_wall() || is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			$jump.play()
			motion.y = -360
			
			if is_on_wall():
				motion.x = - 600 * velocity_x
				
				
				
		
	motion = move_and_slide(motion, UP)
	if is_on_floor():
		$jump.stop()
	if !is_on_wall():
			
		if Input.is_action_just_pressed("ui_attack"):
			
			state = ATTACK
			
			$sword.play()
	
	
func attack_state(delta):
	animationState.travel("Attack")
	
	
func attack_animation_finished():
	state = MOVE
	$sword.stop()



func _on_DodoHurtBox_area_entered(area):
	if area.name == "PumpHitBox":
		$sword.stop()
		health -= 10
		get_node("/root/Hud").health = health
	elif area.name == "BlueFire":
		health -= 20
		get_node("/root/Hud").health = health
	elif area.name.find("RedFire", 0) > 0:
		health -= 15
		get_node("/root/Hud").health = health
	elif area.name == "WheelHitBox":
		health -= 5
		get_node("/root/Hud").health = health
	elif area.name.find("fireflyer", 0) > 0:
		health -= 5
		get_node("/root/Hud").health = health

