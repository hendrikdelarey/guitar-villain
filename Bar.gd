extends Spatial

var note_scn = preload("res://Note.tscn")

var notes_data = [
	{
		"pos": 0,
		"len": 100
	},
	{
		"pos": 400, # 400 * 0.005 = 2 units in Godot
		"len": 100
	},
	{
		"pos": 800, # 800 * 0.005 = 4 units in Godot
		"len": 100
	},
	{
		"pos": 1200, # 800 * 0.005 = 6 units in Godot
		"len": 100
	},
]

var note_scale = 0.005

# Called when the node enters the scene tree for the first time.
func _ready():
	add_notes()


func add_notes():
	for n in notes_data:
		var note = note_scn.instance()
		randomize()
		note.line = randi()%3 + 1
		note.position = n.pos*note_scale
		print_debug("Note added ", note)
		add_child(note)
