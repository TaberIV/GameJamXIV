/// @description Set sprite
image_xscale = (move_input[0] != 0 and floor(action) != ATTACK) ? sign(move_input[0]) : image_xscale;

switch (action) {
	case NONE:
	case MOVE:
		if (!grounded) {
			sprite_index = spr_player_jump;
			if (z_velocity < 0)
				image_index = clamp(image_index, 0, 1.75);
			else
				image_index = clamp(image_index, 2, 4);
		} else if (action == MOVE) {
			if (sprite_index != spr_player_run)
				image_index = 0;
			sprite_index = spr_player_run;
		} else if (action == NONE)
			sprite_index = spr_player_idle;
		break;
	case BLOCK:
		if (sprite_index != spr_player_block)
			image_index = 0;
		sprite_index = spr_player_block;
		image_index = clamp(image_index, 0, 1);
		break;
	case ATTACK:
		var spr_attack = spr_player_attack_weak0 + attack_num;
		if (sprite_index != spr_attack)
			image_index = 0;
		sprite_index = spr_attack;
		break;
	default:
		sprite_index = spr_player_idle;
}