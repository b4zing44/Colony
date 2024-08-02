extends Node
class_name StateBase

@export var main_scene: Node

func enter_state():
	pass


func exit_state():
	pass


func process(_delta: float):
	pass


func physics_process(_delta):
	pass


func unhandled_input(event: InputEvent):
	pass
	
		

func handle_camera_drag(event: InputEvent):
	if event.is_action_pressed("click_middle"):
		main_scene.is_dragging_map = true
	elif event.is_action_released("click_middle"):
		main_scene.is_dragging_map = false
	if main_scene.is_dragging_map and event is InputEventMouseMotion:
		event = event as InputEventMouseMotion
		main_scene.camera.translate(-event.relative * (main_scene.camera.zoom * 2))
		
		
func handle_camera_zoom(event: InputEvent):
	if event.is_action("scroll_down"):
		main_scene.camera.zoom -= Vector2(0.1, 0.1)
	elif event.is_action("scroll_up"):
		main_scene.camera.zoom += Vector2(0.1, 0.1)
