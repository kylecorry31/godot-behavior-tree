@icon("../icons/selector.svg")
class_name SelectorNode
extends BehaviorTreeNode

@export var resume_running: bool = false

var _running_idx: int = -1

func tick(actor: Node, blackboard: Blackboard) -> int:
	var children = get_child_tree_nodes()
	
	var start = 0 if _running_idx == -1 or not resume_running else _running_idx

	for i in range(start, children.size()):
		var result = children[i].tick(actor, blackboard)
		if i > _running_idx:
			_running_idx = -1
		if result == RUNNING:
			if i != _running_idx:
				interrupt(actor, blackboard)
			_running_idx = i
			return RUNNING
		elif result == SUCCESS:
			interrupt(actor, blackboard)
			return SUCCESS
	
	# All nodes returned failure
	_running_idx = -1
	return FAILURE

func interrupt(actor: Node, blackboard: Blackboard):
	if _running_idx != -1:
		get_child_tree_nodes()[_running_idx].interrupt(actor, blackboard)
	_running_idx = -1
