/// @description Check for collisions

var enemy = instance_place(x, y, obj_enemy);

if (enemy != noone) {
	enemy.image_xscale *= -1;
	obj_player.hit = true;
}