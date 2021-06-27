extends Spatial

onready var bar_node = $Bar

var short_note_scn = preload("res://Note/ShortNote.tscn")
var long_note_scn = preload("res://Note/LongNote.tscn")

var note_scale
var bar_data
var speed

func setup(game):
	note_scale = game.note_scale
	bar_node.setup(game)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_notes()


func add_notes():
	var line = 1
	for line_data in bar_data:
		for note_data in line_data.notes:
			add_note(line, note_data)
		line += 1

func add_note(line, data):
	var note_scn
	if int(data.len) >= 400:
		note_scn = long_note_scn
	else:
		note_scn = short_note_scn
		
	var note = note_scn.instance()
	note.line = line
	note.position = int(data.pos)
	note.length = int(data.len)
	note.length_scale = note_scale
	note.speed = speed
	add_child(note)
