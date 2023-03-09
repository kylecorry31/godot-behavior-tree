@icon("./icons/action.svg")
class_name BehaviorTreeNode
extends Node

const SUCCESS = 1
const FAILURE = 2
const RUNNING = 3

func tick(actor: Node, blackboard: Blackboard) -> int:
	return SUCCESS

func interrupt(actor: Node, blackboard: Blackboard):
	pass

func interrupt_children(actor: Node, blackboard: Blackboard):
	for node in get_child_tree_nodes():
		node.interrupt(actor, blackboard)

func get_child_tree_nodes() -> Array[BehaviorTreeNode]:
	var children = get_children()
	var nodes: Array[BehaviorTreeNode] = []
	for child in children:
		if child is BehaviorTreeNode:
			nodes.append(child)
	return nodes
