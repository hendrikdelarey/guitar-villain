extends "res://Note/BaseNote.gd"

func _on_process(delta):
	._on_process(delta)
	if not is_collected and is_colliding and picker:
		if picker.is_collecting:
			collect()
