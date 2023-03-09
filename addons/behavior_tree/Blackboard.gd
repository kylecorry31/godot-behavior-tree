@icon("./icons/blackboard.svg")
class_name Blackboard
extends Node

var data = {}

func get_value(key: String, default_value: Variant = null) -> Variant:
	return data.get(key, default_value)

func set_value(key: String, value: Variant):
	data[key] = value

func has_value(key: String):
	return data.has(key)

func clear_value(key: String):
	data.erase(key)
