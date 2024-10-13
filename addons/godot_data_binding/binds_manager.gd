extends Node

var binds: Array[Bind]

func add_bind(bind: Bind, sync: bool = false) -> void:
	#TODO Have to think how I will do this
	#_assert_bind(bind)

	if binds.has(bind): return
	binds.append(bind)
	_connect_signals(bind)

func remove_bind(bind: Bind) -> void:
	_disconnect_signals(bind)
	if binds.has(bind): binds.erase(bind)

#func _assert_bind(bind: Bind) -> void:
	#assert(not binds.has(bind), "bind already exists")
	#assert(bind.source_object, "source object must be valid")
	#assert(bind.destiny_object, "destity object must be valid")
	#assert(bind.source_object.has_signal(bind.source_signal), "source object must have the "+bind.source_signal+" signal")
	#if not bind.destiny_signal.is_empty():
		#assert(bind.destiny_object.has_signal(bind.destiny_signal), "destiny object must have the "+bind.destiny_signal+" signal")
	#assert(bind.source_object.get_property_list().has(bind.source_property), "source object must have the "+bind.source_property+" property")
	#assert(bind.destiny_object.get_property_list().has(bind.destity_property), "destiny object must have the "+bind.destity_property+" property")

func _connect_signals(bind: Bind) -> void:
	bind.source_signal_emited.connect(_source_signal_emitted.bind(bind))
	bind.destiny_signal_emited.connect(_destiny_signal_emitted.bind(bind))

func _disconnect_signals(bind: Bind) -> void:
	bind.source_signal_emited.disconnect(_source_signal_emitted)
	bind.destiny_signal_emited.disconnect(_destiny_signal_emitted)

func _source_signal_emitted(bind: Bind) -> void:
	_disconnect_signals(bind)
	bind.destiny_object.set(bind.destity_property, bind.source_object.get(bind.source_property))
	_connect_signals(bind)

func _destiny_signal_emitted(bind: Bind) -> void:
	_disconnect_signals(bind)
	bind.source_object.set(bind.source_property, bind.destiny_object.get(bind.destity_property))
	_connect_signals(bind)

func get_binds_from_source_obj(obj: Object) -> Array[Bind]:
	var result: Array[Bind]
	for bind in binds:
		if bind.source_object == obj: result.append(bind)
	return result

func get_binds_from_destiny_obj(obj: Object) -> Array[Bind]:
	var result: Array[Bind]
	for bind in binds:
		if bind.destiny_object == obj: result.append(bind)
	return result

func get_binds_from_objects(source_obj: Object, destiny_obj: Object) -> Array[Bind]:
	var result: Array[Bind]
	for bind in binds:
		if bind.source_object == source_obj and bind.destiny_object == destiny_obj: result.append(bind)
	return result
