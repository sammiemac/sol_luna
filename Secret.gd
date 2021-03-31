extends Area2D


func _ready():
	pass


func _on_Secret_body_entered(body):
	get_tree().change_scene("res://Screens/Secret.tscn")
