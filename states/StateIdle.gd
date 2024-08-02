extends StateBase
class_name StateIdle

func enter_state():
	pass
	
	
func exit_state():
	pass
	
	
func process(_delta: float):
	pass
	

func physics_process(_delta):
	pass
	
func unhandled_input(event: InputEvent):
	handle_camera_drag(event)
	handle_camera_zoom(event)
	
	## Left click
	if event is InputEventMouseButton:
		event = event as InputEventMouseButton
		
		# Check for actor under click
		
	
	
