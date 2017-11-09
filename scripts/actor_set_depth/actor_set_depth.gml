/// @description sets depth of actors

// Set depth
if (ground == 0)
	depth = floor(-y) * 10;
else {
	var wall = instance_place(x, y, obj_wall);
	if (wall != noone)
		depth = wall.depth - 1;
}