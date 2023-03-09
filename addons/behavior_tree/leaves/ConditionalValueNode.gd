class_name ConditionalValueNode
extends ConditionNode

@export var property: String

func tick(actor: Node, blackboard: Blackboard) -> int:
	return SUCCESS if blackboard.get_value(property, false) else FAILURE
