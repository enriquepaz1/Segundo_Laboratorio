extends Area2D

func _on_Area2D_body_entered(body):
	#el layer 
		if body.get_name() == "KinematicBody2D":		
			 get_tree().change_scene("res://Scenes/map2.tscn")
			 print(body.get_name())
