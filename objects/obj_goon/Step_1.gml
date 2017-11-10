/// @description Sets enemy "input"

if (action != HIT_STUN) {
	// Movement
	enemy_follow_player(150);

	jump_pressed = false;

	action = NONE;
		
	if (move_input[0] != 0 or move_input[1] != 0)
		action = MOVE;
	if (sprite_index == spr_goon_attack and image_index != 6) {
		action = ATTACK;
	}
}