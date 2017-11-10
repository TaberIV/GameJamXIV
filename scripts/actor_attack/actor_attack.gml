#region Attacks
if (action == ATTACK and image_index == attack_active_frame[attack_num]) {
	if (object_index == obj_player) {
		var hitbox = instance_create_depth(x, y, depth - 1, obj_player_hitbox);
		hitbox.image_xscale = image_xscale;
	}
	else {
		var hitbox = instance_create_depth(x, y, depth - 1, obj_hitbox);
		hitbox.image_xscale = 2 * image_xscale;
		hitbox.damage = 100000;
	}
	hitbox.sprite_index = spr_player_hitbox;
} else if (attack_num == -1 or floor(image_index) != attack_active_frame[attack_num])
	instance_destroy(object_index == obj_player ? obj_player_hitbox : instance_nearest(x, y, obj_hitbox));
#endregion