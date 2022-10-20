extends Area2D

func _on_Area2D2_body_entered(body):
	 if body.get_name() == "KinematicBody2D":		
		 get_tree().change_scene("res://map3.tscn")
		 print(body.get_name())	
