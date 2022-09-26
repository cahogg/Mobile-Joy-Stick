extends CanvasLayer

#Used to allow Joy Stick to be active when held.
var move_vector = Vector2(0, 0)
var joystick_active = false

signal use_move_vector

#Checks if Touch Screen Joystick is pressed. Commented print out incase needed for testing.
func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if $TouchScreenButton.is_pressed():
			move_vector = calculate_move_vector(event.position)
			# print(event.position)
			joystick_active = true
			#toggles inner object visibility
			$InnerCircle.position = event.position
			$InnerCircle.visible = true
			
	if event is InputEventScreenTouch:
		if event.pressed == false:
			joystick_active = false
			$InnerCircle.visible = false

func _physics_process(_delta):
	if joystick_active == true:
		emit_signal("use_move_vector", move_vector)

#keeps within the bounds of the Touch Screen Node. Node shape is bigger than texture on purpose.
func calculate_move_vector(event_position):
	#The Center of the Button. My math was sides of each side, divided by 2. Check later for accuracy.
	var texture_center = $TouchScreenButton.position + Vector2(128,128)
	return (event_position - texture_center).normalized()
