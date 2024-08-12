extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var collision_shape = %CollisionShape2D
@onready var label_state_name = %LabelStateName
@onready var sprite_body = %SpriteBody
@onready var sprite_selection = %SpriteSelection
@onready var sprite_pre_selection = %SpritePreSelection

var states = {
	"ActorStateIdle": %ActorStateIdle
}

var selected: bool = false
var current_state: Node = null
var current_state_name: String = ""

func _ready():
	# Visibility etc.
	sprite_selection.visible = false
	sprite_pre_selection.visible = false


func _process(delta):
	pass
	
	
func _physics_process(delta):
	pass


func change_state(new_state_name: String): 
	current_state_name = new_state_name
	current_state = states[new_state_name]


func set_selected(value: bool):
	sprite_selection.visible = value
	selected = value

	
func set_pre_selected(value: bool):
	sprite_pre_selection.visible = value
	




