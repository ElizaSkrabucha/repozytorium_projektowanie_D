extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_LineEdit_text_entered(new_text):
	$TextureRect/Label2.text = "Welcome, " + new_text
	$Button.visible = true
	global.jackass = new_text
	
