/// @description Sets enemy "input"

if (action != HIT_STUN) {
	// Movement
	enemy_follow_player(150);

	jump_pressed = false;

	action = NONE;
		
	if (move_input[0] != 0 or move_input[1] != 0)
		action = MOVE;
}