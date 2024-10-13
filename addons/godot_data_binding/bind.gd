extends Node
class_name Bind

signal source_signal_emited()
signal destiny_signal_emited()

var source_object: Object
var destiny_object: Object
var source_property: StringName
var destity_property: StringName
var source_signal: StringName
var destiny_signal: StringName
var source_signal_arg_count: int
var destiny_signal_arg_count: int

func _init(source_obj: Object
		, destiny_obj: Object
		, source_prop: StringName
		, destiny_prop: StringName
		, _source_signal: StringName = "property_changed"
		, _source_signal_arg_count: int = 0
		, _destiny_signal: StringName = ""
		, _destiny_signal_arg_count: int = 0) -> void:

	source_object = source_obj
	destiny_object = destiny_obj
	source_property = source_prop
	destity_property = destiny_prop
	source_signal = _source_signal
	destiny_signal = _destiny_signal
	source_signal_arg_count = _source_signal_arg_count
	destiny_signal_arg_count = _destiny_signal_arg_count

	if source_signal_arg_count > 0:
		source_object.connect(source_signal, _on_source_signal_emited.unbind(source_signal_arg_count))
	else:
		source_object.connect(source_signal, _on_source_signal_emited)

	if not destiny_signal.is_empty():
		if destiny_signal_arg_count > 0:
			destiny_object.connect(destiny_signal, _on_destiny_signal_emited.unbind(destiny_signal_arg_count))
		else:
			destiny_object.connect(destiny_signal, _on_destiny_signal_emited)

func _on_source_signal_emited() -> void:
	source_signal_emited.emit()

func _on_destiny_signal_emited() -> void:
	destiny_signal_emited.emit()
