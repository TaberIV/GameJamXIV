if (action == HIT_STUN) {
	move_override = true;
	move_input[0] = lerp(move_input[0], 0, 0.05);
	
	if (abs(move_input[0]) * move_speed < 1 and height == -ground)
		action = NONE;
}

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
y = clamp(y, global.room_y_min, room_height);

actor_set_depth();