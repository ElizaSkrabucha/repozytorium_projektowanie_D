extends Control
var rng = RandomNumberGenerator.new()
var tries = 8

func _ready():
	rng.randomize()
	var selected_number = rng.randi_range(1,100)
	get_node("SpinBox3").value = selected_number
	print(selected_number)
	get_node("Lives").value = tries

func _on_YourGuess_value_changed(guess):
	tries = tries - 0.5
	get_node("YourGuess").value = 0
	get_node("Lives").value = tries
	#win
	if guess == $SpinBox3.value:
		get_tree().change_scene("res://Winning.tscn")
	#too much
	if guess > $SpinBox3.value:
		get_node("MoreLess").text = "Too Much, You Moron!"
	#too little
	if guess < $SpinBox3.value:
		get_node("MoreLess").text = "Not Enough, You Moron!"
	#no tries left
	if tries == 0: 
		get_tree().change_scene("res://Losing.tscn")
	#just about
	if $Lives.value == 0 and guess == $SpinBox3.value:
		get_tree().change_scene("res://Winning.tscn")
	
