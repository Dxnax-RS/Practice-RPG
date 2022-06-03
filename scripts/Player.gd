extends KinematicBody2D

const ACCELERATION = 10
const MAX_SPEED = 100
const FRICTION = 10

#variables
var velocity = Vector2.ZERO
var input_vector = 	Vector2.ZERO
var animationIndex = 4
var animations = ["PlayerRunRight", "PlayerRunLeft", "PlayerRunUp", "PlayerRunDown", 
"PlayerIdleRight", "PlayerIdleLeft", "PlayerIdleUp", "PlayerIdleDown"]
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
#End variables

#Code
func _physics_process(delta):
	input_vector = 	Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector);
		animationTree.set("parameters/Run/blend_position", input_vector);
		animationState.travel("Run");
#		if input_vector.x > 0: animationIndex = 0
#		if input_vector.x < 0: animationIndex = 1
#		if input_vector.y < 0: animationIndex = 2
#		if input_vector.y > 0: animationIndex = 3
#		animationPlayer.play(animations[animationIndex])
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION)
		#print(velocity)
	else:
		animationState.travel("Idle");
#		if animationIndex < 4: animationIndex += 4
#		animationPlayer.play(animations[animationIndex])
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		#print(velocity)		
	
	velocity = move_and_slide(velocity)
#End code
