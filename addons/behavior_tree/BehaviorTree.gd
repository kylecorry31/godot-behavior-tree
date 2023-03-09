@icon("./icons/tree.svg")
class_name BehaviorTree
extends Node

@export var actor: Node
@export var blackboard: Blackboard


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var child = get_child(0)
	if child is BehaviorTreeNode:
		child.tick(actor, blackboard)
