extends KinematicBody2D


export (int) var run_speed = 100
export (int) var jump_speed = -4800
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')

	if jump and is_on_floor():
		$AnimatedSprite.animation = "Jump"
		jumping = true
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	if velocity.x == 0:
		$AnimatedSprite.animation = "stand"

	if velocity.x != 0:
		$AnimatedSprite.animation = "Run"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))


#func _on_Killspace_body_entered(body):
	#get_tree().change_scene("res://GameOver.tscn")


func _on_Killzone_body_entered(body):
	get_tree().change_scene("res://GameOver.tscn")


func _on_Top_body_entered(body):
	$AnimatedSprite.animation = "Dead"


func _on_Treeboy_body_entered(body):
	get_tree().change_scene("res://WinScene.tscn")
