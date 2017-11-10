/// @description Initialize variables

actor_init_move(2);
actor_init_jump(-50, 50 * (2 / 3));
actor_init_height();
actor_set_depth();

hit_by = noone;
height = -80;

var wall = instance_place(x, y, obj_wall)
if (wall != noone) {
	ground = -wall.height;
	while (height >= -wall.height)
		height += 10;
}