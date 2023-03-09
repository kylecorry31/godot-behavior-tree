class_name ClearValueNode
extends BlackboardNode

@export var property: String

func tick(actor: Node, blackboard: Blackboard) -> int:
	blackboard.clear_value(property)
	return SUCCESS
