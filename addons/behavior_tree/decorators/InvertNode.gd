@icon("../icons/invert.svg")
class_name InvertNode
extends BehaviorTreeNode

func tick(actor: Node, blackboard: Blackboard) -> int:
	var children = get_child_tree_nodes()
	if children.size() > 0:
		var result = children[0].tick(actor, blackboard)
		if result == RUNNING:
			children[0].interrupt(actor, blackboard)
		return SUCCESS if result == FAILURE else FAILURE
	return SUCCESS
