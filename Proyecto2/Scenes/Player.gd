extends KinematicBody2D


const ACCEL = 500
const MAX_SPEED = 80
const FRICTION = 500
const GRAVITY = 20
const JUMP_HEIGHT = 500
const up = Vector2(0,-1)

var velocity = Vector2.ZERO
onready var state_machine = $AnimationTree.get("parameters/playback")
var hurt = false
var die = false
var life = 2

func _physics_process(delta):
	velocity.y += GRAVITY
	#FRICTION = 0
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCEL * delta)
		state_machine.travel("run")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		state_machine.travel("idle")
		
	if Input.is_action_just_pressed("attack"):
		state_machine.travel("attack")
	
	if hurt:
		state_machine.travel("hurt")
		hurt = false	
	
	if Input.is_action_just_pressed("jump"):
		velocity.y -= JUMP_HEIGHT
		state_machine.travel("jump")
		velocity.x = lerp (velocity.x,0,0.5)
	#velocity = move_and_slide(velocity,up)		
		
	if die:
		state_machine.travel("dead")
		velocity = Vector2.ZERO	

	if velocity.x < 0:
		$Sprite.scale.x = -1		
	elif velocity.x > 0:
		$Sprite.scale.x = 1
	velocity = move_and_slide(velocity)
	
	
func add_coin():
	var canvasLayer = get_tree().get_root().find_node("CanvasLayer",true,false)
	canvasLayer.handlecoinCollection()
	$coin_sound.playing = true
	   
	

func _on_Area2D_area_entered(area):
	hurt = true
	life -= 1
	if life == 0:
		die = true
	print (area)	
	print ("ouch")
