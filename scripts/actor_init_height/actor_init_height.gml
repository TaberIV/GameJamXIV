var wall = instance_place(x, y, obj_wall)
if (wall != noone) {
	ground = -wall.height;
	while (height >= -wall.height)
		height -
		= 10;
}