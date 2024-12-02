extends Node

@export var game_manager: NodePath  # Assign the GameManager node in the editor
@onready var manager = get_node(game_manager)

var start_time: int

func _ready():
	start_time = Time.get_ticks_msec()

func level_failed():
	var elapsed_time = Time.get_ticks_msec() - start_time
	manager.update_longest_survival(elapsed_time)
	manager.save_data()
