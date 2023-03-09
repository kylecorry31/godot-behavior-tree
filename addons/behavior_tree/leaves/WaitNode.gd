@icon("../icons/wait.svg")
class_name WaitNode
extends BehaviorTreeNode

@export var min_wait_time: float
@export var max_wait_time: float

var _wait_until_time: int = -1

func tick(actor: Node, blackboard: Blackboard) -> int:
	if _wait_until_time == -1:
		_wait_until_time = Time.get_ticks_msec() + int(randf_range(min_wait_time, max_wait_time) * 1000)
	
	if Time.get_ticks_msec() >= _wait_until_time:
		interrupt(actor, blackboard)
		return SUCCESS
	
	return RUNNING

func interrupt(actor: Node, blackboard: Blackboard):
	_wait_until_time = -1
