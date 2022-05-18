extends KinematicBody2D

#variables
var velocity = Vector2.ZERO
var input_vector = 	Vector2.ZERO
#End variables

#Code
func _physics_process(delta):
	input_vector = 	Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO
	
	move_and_collide(velocity)
#End code
