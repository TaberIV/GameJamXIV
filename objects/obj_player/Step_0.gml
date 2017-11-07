/// @description Process player

#region Jump
if (height < 0) {
	var wall = instance_place(x, y, obj_wall);
	ground = (wall != noone and -height >= wall.height and y <= wall.y and y > wall.y - wall.width)
				? wall.height : 0;
}

if (height == -ground and jump_pressed and (action != ATTACK or (hit and cancel))) {
	z_velocity = jump_speed;
	height += z_velocity;
	
	action = MOVE;
}
else if (height == -ground and z_velocity >= 0) {
	z_velocity = 0;
}
else if (height < -ground or z_velocity < 0) {
	// Gravity
	z_velocity += jump_grav;
	height += z_velocity;
}

height = clamp(height, -999, -ground);
grounded = height == -ground and z_velocity == 0;
#endregion

#region Move player
if (action == MOVE or move_override) {
	var x1 = x;
	var y1 = y;
	var x2 = x + move_input[0] * move_speed;
	var y2 = y + move_input[1] * move_speed;
	
	var wall = instance_place(x2, y2, obj_wall);
	if (wall == noone || -height > wall.height) {
		x += move_input[0] * move_speed;
		y += move_input[1] * move_speed;
	}
	else {		
		// Horizontal collision
		for (var i = 0; i < round(abs(x2 - x1)); i++) {
			x += sign(x2 - x1);
			
			if (place_meeting(x, y, obj_wall) and y <= wall.y and y > wall.y - wall.width
					and height != -wall.height) {
				x -= sign(x2 - x1);
				break;
			}
		}
		
		// Vertical collision
		for (var i = 0; i < round(abs(y2 - y1)); i++) {
			y += sign(y2 - y1);
			
			if (place_meeting(x, y, obj_wall) and y <= wall.y and y > wall.y - wall.width
								and height != -wall.height) {
				y -= sign(y2 - y1);
				break;
			}
		}
	}
}

x = clamp(x, (x - bbox_left), room_width + (x - bbox_right));
y = clamp(y, sprite_get_height(mask_index), room_height);

// Set depth
depth = -y - ground;
#endregion

#region Attacks
	if (action == ATTACK and floor(image_index) == attack_active_frame[attack_num]) {
		var hitbox = instance_create_depth(x, y, depth - 1, obj_hitbox);
		hitbox.sprite_index = spr_player_hitbox_weak0 + attack_num;
		hitbox.image_xscale = image_xscale;
	}
#endregion