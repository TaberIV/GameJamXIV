/// @description Set sprite
image_xscale = (move_input[0] != 0) ? sign(move_input[0]) : image_xscale;

if (!grounded) {
	sprite_index = spr_player_jump;
	image_index = clamp(image_index, 0, 3);
}
else {
	switch (action) {
		case MOVE:
			if (sprite_index != spr_player_run)
				image_index = 0;
			sprite_index = spr_player_run;
			break;
		case BLOCK:
			if (sprite_index != spr_player_block)
				image_index = 0;
			sprite_index = spr_player_block;
			image_index = clamp(image_index, 0, 1);
			break;
		case ATTACK:
			if (sprite_index != spr_player_attack_weak1)
				image_index = 0;
			sprite_index = spr_player_attack_weak1;
			break;
		default:
			sprite_index = spr_player_idle;
	}
}