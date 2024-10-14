extends Node
class_name Bind

signal source_signal_emited
signal destiny_signal_emited

var source_object: Object
var destiny_object: Object
var source_property: StringName
var destity_property: StringName
var source_signal: StringName
var destiny_signal: StringName

func _init(source_obj: Object
		, destiny_obj: Object
		, source_prop: StringName
		, destiny_prop: StringName
		, _source_signal: StringName
		, _destiny_signal: StringName) -> void:

	source_object = source_obj
	destiny_object = destiny_obj
	source_property = source_prop
	destity_property = destiny_prop
	source_signal = _source_signal
	destiny_signal = _destiny_signal

	if not source_signal.is_empty():
		source_object.connect(source_signal, _on_source_signal_emited)

	if not destiny_signal.is_empty():
		destiny_object.connect(destiny_signal, _on_destiny_signal_emited)

func _on_source_signal_emited(_1=null, _2=null, _3=null, _4=null, _5=null) -> void:
	source_signal_emited.emit()

func _on_destiny_signal_emited(_1=null, _2=null, _3=null, _4=null, _5=null) -> void:
	destiny_signal_emited.emit()
