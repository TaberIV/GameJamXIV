/// @description Set sprite
switch (action) {
	case NONE:
		sprite_index = spr_goon_idle;
		image_xscale *= (random(1) < 0.99) ? 1 : -1;
		break;
	case MOVE:
		if (sprite_index != spr_goon_walk)
			image_index = 0;
		sprite_index = spr_goon_walk;
		break;
	case HIT_STUN:
		if (sprite_index != spr_goon_stun)
			image_index = 0;
		sprite_index = spr_goon_stun;
		break;
	case ATTACK:
		if (sprite_index != spr_goon_attack)
			image_index = 0;
		sprite_index = spr_goon_attack;
		break;
	default:
		sprite_index = spr_goon_idle;
}