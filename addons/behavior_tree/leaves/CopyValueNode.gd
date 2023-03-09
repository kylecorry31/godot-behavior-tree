class_name CopyValueNode
extends BlackboardNode

@export var from: String
@export var to: String

func tick(actor: Node, blackboard: Blackboard) -> int:
	if blackboard.has_value(from):
		blackboard.set_value(to, blackboard.get_value(from, null))
	return SUCCESS
