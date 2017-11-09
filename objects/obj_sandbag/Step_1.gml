/// @description Sets enemy "input"

if (action != HIT_STUN) {
	// Movement
	move_input = [0, 0];
	normalize(move_input);

	jump_pressed = false;
	block_down = false;

	action = NONE;

	if (move_input[0] != 0 or move_input[1] != 0)
		action = MOVE;
	if (block_down and grounded)
		action = BLOCK;
}