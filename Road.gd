extends Spatial

var bar_scn = preload("res://bar.tscn")
onready var bars_node = $BarsNode
var bars = []
var bar_length
var curr_location
var speed
var note_scale

var curr_bar_index
var track_data

func setup(game):
	speed = Vector3(0, 0, game.speed)
	bar_length = game.bar_length
	curr_location = Vector3(0, 0, -bar_length)
	note_scale = game.note_scale
	curr_bar_index = 0
	track_data = game.map.tracks
	add_bars()

func _process(delta):
	bars_node.translate(speed*delta)
	
	for bar in bars:
		if bar.translation.z + bars_node.translation.z >= bar_length:
			remove_bar(bar)
			add_bar()

func add_bars():
	for i in range(3):
		add_bar()

func add_bar():
	var bar = bar_scn.instance()
	bar.translation = Vector3(curr_location.x, curr_location.y, curr_location.z)
	bar.note_scale = note_scale
	bar.bar_data = get_bar_data()
	bar.speed = speed
	bars.append(bar)
	bars_node.add_child(bar)
	curr_location += Vector3(0, 0, -bar_length)
	curr_bar_index += 1

func get_bar_data():
	var green_data = track_data[0].bars[curr_bar_index]
	var red_data = track_data[1].bars[curr_bar_index]
	var yellow_data = track_data[2].bars[curr_bar_index]
	return [green_data, red_data, yellow_data]
	
func remove_bar(bar):
	bar.queue_free()
	bars.erase(bar)
