/// @description Set sprite
switch (action) {
	case NONE:
		sprite_index = spr_goon_idle;
		image_xscale *= (random(1) < 0.99) ? 1 : -1;
		break;
	case MOVE:
		sprite_index = spr_goon_walk;
		break;
	case HIT_STUN:
		sprite_index = spr_goon_stun;
		break;
	default:
		sprite_index = spr_goon_idle;
}