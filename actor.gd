extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var collision_shape = %CollisionShape2D
@onready var sprite_body = %SpriteBody
@onready var sprite_selection = %SpriteSelection

var selected: bool = false

func _ready():
	# Visibility
	sprite_selection.visible = false


func set_selected(value: bool):
	sprite_selection.visible = value
	selected = value


