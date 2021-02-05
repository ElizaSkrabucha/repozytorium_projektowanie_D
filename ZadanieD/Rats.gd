extends KinematicBody2D

const GRAVITY = 10
var SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1

#var is_dead = false


func _ready():
	if SPEED == 0:
		$AnimatedSprite.play("Dead")
	if SPEED != 0:
		$AnimatedSprite.play("Walk")
		
func _physics_process(delta):
	velocity.x = SPEED * direction 
	if direction == 1:
		$AnimatedSprite.flip_h = false 
	else:
		$AnimatedSprite.flip_h = true
	#$AnimatedSprite.play("Walk")
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *=-1 
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1  
		$RayCast2D.position.x *=-1 
	
	#if SPEED == 0:
		#$AnimatedSprite.play("Dead")

func _on_Sides_body_entered(body):
	print("boohoo")
	get_tree().change_scene("res://GameOver.tscn")


func _on_Timer_timeout():
	queue_free()


func _on_Top_body_entered(body):
		#$AnimatedSprite.play("Dead")
	SPEED = 0
	if SPEED == 0:
		$AnimatedSprite.play("Dead")
	set_collision_layer_bit(4,false) 
	set_collision_mask_bit(0,false)
	$Top.set_collision_layer_bit(4,false)
	$Top.set_collision_mask_bit(0,false)
	$Sides.set_collision_layer_bit(4,false)
	$Sides.set_collision_mask_bit(0,false)
	$Timer.start()

