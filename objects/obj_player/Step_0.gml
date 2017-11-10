/// @description Process player

actor_jump();
actor_move();
actor_attack();

var hitbox = instance_place(x, y, obj_hitbox);
var enemy = instance_nearest(x, y, obj_goon);
if (hitbox != noone and enemy.height + 20 > height and enemy.height - 20 < height and hitby == noone) {
	hp--;
} 
hitby = hitbox;

if (hp < 0)
	game_restart();