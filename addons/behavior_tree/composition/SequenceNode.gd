@icon("../icons/sequence.svg")
class_name SequenceNode
extends BehaviorTreeNode

@export var resume_running: bool = true

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
		if result != SUCCESS:
			interrupt(actor, blackboard)
			return result
	
	# All nodes returned success
	_running_idx = -1
	return SUCCESS

func interrupt(actor: Node, blackboard: Blackboard):
	if _running_idx != -1:
		get_child_tree_nodes()[_running_idx].interrupt(actor, blackboard)
	_running_idx = -1
