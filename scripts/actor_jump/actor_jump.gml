/// @description Handles all jumpimg/falling/platforms of actor

// If above floor, check if standing on a block
if (height < 0) {
	var wall = instance_place(x, y, obj_wall);
	ground = (wall != noone and -height >= wall.height and y <= wall.y and y > wall.y - wall.width)
				? wall.height : 0;
}

// Start jumping
if (height == -ground and jump_pressed and (action != ATTACK or (hit and cancel))) {
	z_velocity = jump_speed;
	height += z_velocity;
	
	action = MOVE;
}
// If on a block or the floor, do not fall
else if (height == -ground and z_velocity >= 0) {
	z_velocity = 0;
}
// Free fall
else if (height < -ground or z_velocity < 0) {
	// Gravity
	z_velocity += jump_grav;
	height += z_velocity;
}

height = clamp(height, -999, -ground);
grounded = height == -ground and z_velocity == 0;