extends RefCounted
class_name Bind

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
