extends KinematicBody2D


#Moves Player with MobileJoyStick, and flips. Won't actually flip, as it does not extend to the X axis.
func _on_MobileJoyStick_use_move_vector(move_vector):
	#tut showed 128, assumed that was for side of Touch Screen Node. My side is 256 pixels.
	move_and_slide(move_vector * 256)
	
	$Sprite.flip_h = move_vector.x < 0


#func _on_MobileJoyStick_use_move_vector():
	#pass # Replace with function body.
