extends Node2D


func _ready():
	get_node("ParallaxBackground/Label").text = global.jackass + ", hurry up. He's not getting any smarter."


func _on_Killzone_body_entered(body):
	get_tree().change_scene("res://GameOver.tscn")

