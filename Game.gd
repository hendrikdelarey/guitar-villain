extends Spatial

onready var music_node = $Music
onready var road_node = $Road

var audio
var audio_file = "res://Ill System - Rock Bottom.ogg"

var tempo
var bar_length
var quarter_time
var speed
var note_scale
var start_pos_in_sec


# Called when the node enters the scene tree for the first time.
func _ready():
	audio = load(audio_file)
	calc_params()
	
	music_node.setup(self)
	road_node.setup(self)

func calc_params():
	tempo = 90
	bar_length = 8
	quarter_time = 60/float(tempo)
	speed = bar_length/float(4*quarter_time)
	note_scale = bar_length/float(4*400)
	start_pos_in_sec = 12
