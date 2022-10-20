extends Control

func _ready():
	$VBoxContainer/Button.grab_focus()
	 
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/main.tscn")


func _on_Button2_pressed():
	get_tree().quit()
