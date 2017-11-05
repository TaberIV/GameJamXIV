/// @description Process player

#region Jump
if (height < 0) {
	var wall = instance_place(x, y, obj_wall);
	ground = (wall != noone and -height >= wall.height and y <= wall.y and y > wall.y - wall.width)
				? wall.height : 0;
}

if (height == -ground and jump_pressed and action <= MOVE) {
	image_index = 0;
	jump_vel = jump_speed;
	height += jump_vel;
}
else if (height == -ground and jump_vel >= 0) {
	jump_vel = 0;
}
else if (height < -ground or jump_vel < 0) {
	// Gravity
	jump_vel += jump_grav;
	height += jump_vel;
}

height = clamp(height, -999, -ground);
grounded = height == -ground and jump_vel == 0;
#endregion


#region Move player
if (action == MOVE) {
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
y = clamp(y, sprite_height, room_height);
#endregion