/// @description checks if this enemy is hit and behaves accordingly

var hitbox = instance_place(x, y, obj_player_hitbox);

if (hitbox != noone and obj_player.height + 20 > height and obj_player.height - 20 < height) {
	z_velocity = clamp(z_velocity, -999, (grounded ? 0 : -3));
	image_xscale = -obj_player.image_xscale;
	if (hitbox != hit_by) {
		action = HIT_STUN;
		hit_by = hitbox;
		obj_player.hit = true;
	
		switch (obj_player.attack_num) {
			case 0:
				move_input[0] = image_xscale * -0.4;
				break;
			case 1:
				if (obj_player.move_input[0] != obj_player.image_xscale) {
					z_velocity = -7;
					move_input[0] = image_xscale * -0.3;
				} else
					move_input[0] = image_xscale * -1;
				break;
			case 2:
				move_input[0] = image_xscale * -3;
				break;
			case 3:
				break;
			case 4:
				move_input[0] = image_xscale * -1.5;
				break;
		}
	}
}