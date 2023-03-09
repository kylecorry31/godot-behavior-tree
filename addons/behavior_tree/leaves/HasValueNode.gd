class_name HasValueNode
extends ConditionNode

@export var property: String

func tick(actor: Node, blackboard: Blackboard) -> int:
	return SUCCESS if blackboard.has_value(property) else FAILURE
