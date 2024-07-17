extends Node

signal make_lever_block_disappear

const MAX_LIVES = 3
var lives = MAX_LIVES

var checkpoint = Vector2(0, 0)
var activated_checkpoints = []

var can_go_to_next_level = false
