extends KinematicBody2D

export var speed = 100 
export var health = 1
var velocity = Vector2.ZERO
var move_direction = 1
var gravity = 800
var hitted = false 

func _physics_process(delta: float) -> void:
	velocity.x = speed * move_direction 
	velocity = move_and_slide(velocity)
	velocity.y += gravity * delta 
	
	
	
	if move_direction == -1:
		$Sprite.flip_h = true 
	else:
		$Sprite.flip_h = false 
	
	if $ray_wall.is_colliding ():
		$anim.play ("Idle")  
		
	if hitted == true : 
		$anim.play = ("Die")
		
	if health < 1:
		$anim.play("Die")

func _on_anim_animation_finished(anim_name):
	if anim_name == "Idle":
		$Sprite.flip_h != $Sprite.flip_h
		$ray_wall.scale.x *= -1
		move_direction *= -1 
		$anim.play("Walk")  
		
		


func _on_hitbox_body_entered(body):
	
	body.motion.y -= 600
	health -= 1
	yield(get_tree().create_timer(0.8),"timeout")
	if health < 1:
		queue_free()
		get_node("hitbox/collision").set_deferred("disabled", true)
		
