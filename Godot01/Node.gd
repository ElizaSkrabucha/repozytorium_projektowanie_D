extends Node

var welocomeFirst = "Hello"
var welcomeSecond = "Holla"
var nameFirst = "Dean"
var nameSecond = "Cass"
var names = ["Dean", "Sam", "Cass"]
var welcomes = ["Supp?", "Hello", "Holla"]
func _ready():
	print(welcomes[1] + " my name is " + names[0])
	print(welcomes[2] + " my name is " + names[2])


#func _process(delta):
#	pass
