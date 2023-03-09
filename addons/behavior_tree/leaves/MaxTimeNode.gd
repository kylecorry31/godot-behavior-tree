class_name MaxTimeNode
extends ConditionNode

@export var property: String
@export var max_time: float

func tick(actor: Node, blackboard: Blackboard) -> int:
	if not blackboard.has_value(property):
		return FAILURE
	var time = blackboard.get_value(property, -1)
	var delta: float = (Time.get_ticks_msec() - time) / 1000.0
	return SUCCESS if delta < max_time else FAILURE
