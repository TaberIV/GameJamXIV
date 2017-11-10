/// @description Initialize variables
hp = 25;
attack_radius = 15;

actor_init_move(3);
actor_init_jump(-50, 50 * (move_speed / 3));
actor_init_height();
actor_init_attack([2], [false]);
actor_set_depth();

hit_by = noone;