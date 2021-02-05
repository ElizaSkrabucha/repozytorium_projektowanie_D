extends Node2D


func _ready():
	get_node("ParallaxBackground/Label").text = global.jackass + ", help the Hero save her idiot boyfriend!"
	


func _on_Gate_body_entered(body):
	get_tree().change_scene("res://Forest.tscn")


func _on_Killspace_body_entered(body):
	get_tree().change_scene("res://GameOver.tscn")
