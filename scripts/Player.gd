extends KinematicBody2D

const ACCELERATION = 10
const MAX_SPEED = 100
const FRICTION = 10

#variables
var velocity = Vector2.ZERO
var input_vector = 	Vector2.ZERO
#End variables

#Code
func _physics_process(delta):
	input_vector = 	Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION)
		#print(velocity)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		#print(velocity)		
	
	velocity = move_and_slide(velocity)
#End code
