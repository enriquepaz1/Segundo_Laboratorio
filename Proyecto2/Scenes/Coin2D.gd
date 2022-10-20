extends Area2D

signal coinCollection


#func _on_Collider_body_entered(body:Node)
#	if body.is_in_group("KinematicBody2D")

#el objeto hace un remove cuando colisiona 
func _on_Area2D_body_entered(body):
	if body.get_name()=="KinematicBody2D":
	   # $AudioStreamPlayer.playing = true	 
		body.add_coin()
		queue_free()
		
	#emit_signal("coinCollection")	
	   
#func on_play_walk_sfx():
#	 if !$AudioStreamPlayer.playing:
#		 $AudioStreamPlayer.play
		


