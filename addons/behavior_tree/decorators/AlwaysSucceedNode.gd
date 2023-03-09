@icon("../icons/succeed.svg")
class_name AlwaysSucceedNode
extends BehaviorTreeNode

func tick(actor: Node, blackboard: Blackboard) -> int:
	var children = get_child_tree_nodes()
	if children.size() > 0:
		var result = children[0].tick(actor, blackboard)
		if result == RUNNING:
			children[0].interrupt(actor, blackboard)
	return SUCCESS
