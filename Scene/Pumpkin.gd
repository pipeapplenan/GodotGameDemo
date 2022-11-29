extends KinematicBody2D


var health = 62
var motion = Vector2()
var knockback = Vector2.ZERO
var knockSpeed = 50
enum STATE {
	KNOCKBACK,
	RUN
}
var state = STATE.RUN


func _ready():
	$PumpHP.hpTotal = health
	$PumpHP.currentHp = health
	$PumpHP.init()


func _physics_process(delta):
	if health > 0:
		if $PlayerDetection.can_see_player():
			motion.y += 10
			if $AttackDetection.can_see_player() && state != STATE.KNOCKBACK:
				$AnimationPlayer.play("Attack")
			elif state != STATE.KNOCKBACK:
				$AnimationPlayer.play("Run")
				var player = $PlayerDetection.player
				var direction = global_position.direction_to(player.global_position)
				var sigx = sign(direction.x)
				if sigx > 0:
					$Sprite.flip_h = false
					knockSpeed = -50
				else:
					$Sprite.flip_h = true
					knockSpeed = 50
				motion.x = sigx * 80
				motion = move_and_slide(motion)
			if state == STATE.KNOCKBACK:
				$AnimationPlayer.play("KnockBack")
				move_and_slide(knockback)
		else:
			$AnimationPlayer.play("Idle")
	else:
		queue_free()
		get_node("/root/Hud").health += 10
		get_node("/root/Hud").killNo += 1




func _on_PumpHurtBox_area_entered(area):
	if area.name == "DodoHitBox":
		var damage = get_node("/root/Hud").level * 5 + 5
		health -= damage
		$PumpHP.update_hp(health)
		state = STATE.KNOCKBACK
		knockback.x = knockSpeed

func _ret_normal():
	if state == STATE.KNOCKBACK:
		state = STATE.RUN
