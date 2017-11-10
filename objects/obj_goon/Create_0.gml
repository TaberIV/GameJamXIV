/// @description Initialize variables
hp = 150;
attack_radius = 30;

actor_init_move(2);
actor_init_jump(-50, 50 * (2 / 3));
actor_init_height();
actor_init_attack([2], [false]);
actor_set_depth();

hit_by = noone;