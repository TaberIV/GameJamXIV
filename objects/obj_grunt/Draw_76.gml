/// @description Set sprite
switch (action) {
	case NONE:
		sprite_index = spr_player_idle;
		image_xscale *= (random(1) < 0.99) ? 1 : -1;
		break;
	case MOVE:
		if (sprite_index != spr_player_run)
			image_index = 0;
		sprite_index = spr_player_run;
		break;
	case HIT_STUN:
		if (sprite_index != spr_player_stun)
			image_index = 0;
		sprite_index = spr_player_stun;
		break;
	case ATTACK:
		if (sprite_index != spr_grunt_attack)
			image_index = 0;
		sprite_index = spr_grunt_attack;
		break;
	default:
		sprite_index = spr_player_idle;
}