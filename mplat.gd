extends Node2D


const IDLE_DURATION = 0.3 #Resting time


export var move_to = Vector2.RIGHT * 192
export var speed = 3.0 #Number of tiles it moves per second
enum {TWO_WAY, ONE_WAY}
export var direction = TWO_WAY
var disabled = true
export var invisible = false
var returning = false


onready var platform = $Platform
onready var tween = $MoveTween
onready var left_ani = $Platform/left
onready var right_ani = $Platform/right
onready var single_ani = $Platform/single
onready var c_short = $Platform/CollisionShape2D_short
onready var c_long = $Platform/CollisionShape2D_long


enum {SHORT, LONG}
export var type = SHORT


#appears on lever flip
#up on button, down off button
func _ready():
	if invisible:
		disappear()
	else:
		appear()


func disappear():
	single_ani.visible = false
	c_short.disabled = true
	c_short.visible = false
	c_long.disabled = true
	c_long.visible = false
	left_ani.visible = false
	right_ani.visible = false


# should toggle children on or off
func appear():
	if type == SHORT:
		single_ani.visible = true
		c_short.disabled = false
		c_short.visible = true
		c_long.disabled = true
		c_long.visible = false
		left_ani.visible = false
		right_ani.visible = false
	else:
		single_ani.visible = false
		c_short.disabled = true
		c_short.visible = false
		c_long.disabled = false
		c_long.visible = true
		left_ani.visible = true
		right_ani.visible = true


func move():
	if not disabled:
		var duration = move_to.length() / float(speed * 32) # <- last number is tile size
		if not returning:
			tween.interpolate_property(platform, "position", Vector2.ZERO, move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
		else:
			tween.interpolate_property(platform, "position", move_to, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
		tween.start()
#		$Timer.wait_time = duration
#		$Timer.start()
		returning = !returning
