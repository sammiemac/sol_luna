extends KinematicBody2D


export var id = 0
export var velocity = Vector2(0,0)
export (int, 0, 200) var push = 100
const SPEED = 300
const CRAWL_SPEED = SPEED * 0.25
const GRAVITY = 30
const JUMPFORCE = -700


onready var standing_collision = $StandingShape
onready var crouching_collision = $CrouchingShape


func _physics_process(delta):
	#Handles walking and idle animations and motion
	_on_stand()
	if Input.is_action_pressed('right_%s' % id):
		velocity.x = SPEED
		$AnimatedSprite.play('walk%s' % id)
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed('left_%s' % id):
		velocity.x = -SPEED
		$AnimatedSprite.play('walk%s' % id)
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.play('idle%s' % id)
	
	#Set fall speed
	velocity.y = velocity.y + GRAVITY
	
	#Handles jumping and falling animations and motion
	if Input.is_action_just_pressed('jump_%s' % id) and is_on_floor():
		velocity.y = JUMPFORCE
		$AnimatedSprite.play('jump%s' % id)
		$SoundJump.play()
	if velocity.y < 0:
		$AnimatedSprite.play('jump%s' % id)
	if not velocity.y < 0 and not is_on_floor():
		$AnimatedSprite.play('fall%s' % id)
	
	#Handles crouch animations and motion
	if Input.is_action_pressed('crouch_%s' % id):
		_on_crouch()
		$AnimatedSprite.play('crouch%s' % id)
	
		if Input.is_action_pressed('right_%s' % id): 
			velocity.x = CRAWL_SPEED
			$AnimatedSprite.flip_h = true
		elif Input.is_action_pressed('left_%s' % id):
			velocity.x = -CRAWL_SPEED
			$AnimatedSprite.flip_h = false
	
	#Handles basic movement
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI/4, false)
	
	#When running stops, slows down motion
	velocity.x = lerp(velocity.x,0,0.2)
	
	#Handles player and box intractions
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("moveables"):
			collision.collider.apply_central_impulse(-collision.normal * push)


#When crouching, disables standing collision and enables crouching collision
func _on_crouch():
	standing_collision.disabled = true
	crouching_collision.disabled = false


#When standing, disables crouching collision and enables standing collision
func _on_stand():
	standing_collision.disabled = false
	crouching_collision.disabled = true
