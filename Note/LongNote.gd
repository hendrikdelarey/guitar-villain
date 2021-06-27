extends "res://Note/BaseNote.gd"

var curr_length
var hold_started = false
var hold_canceled = false

var captured = false

func _on_ready():
	._on_ready()
	curr_length = max(100, length - 100)*length_scale
	$Beam.scale = Vector3(1, 1, curr_length)
	$Beam.set_material(line)

func _on_process(delta):
	._on_process(delta)
	
	if not is_collected:
		if is_colliding and picker and not hold_canceled:
			if picker.is_collecting:
				hold_started = true # start the hold
			elif hold_started:
				hold_canceled = true # drop the hold

		if hold_started and not hold_canceled:
			if not captured:
				var diff = picker.global_transform.origin.z - self.global_transform.origin.z
				print_debug(diff)
				if abs(diff) <= 0.1:
					captured = true
					translate(Vector3(0, 0, diff))
			else:
				curr_length -= speed.z*delta
				if(curr_length <= 0):
					collect()
				else:
					$Beam.scale = Vector3(1, 1, curr_length)
					translate(-speed*delta)
