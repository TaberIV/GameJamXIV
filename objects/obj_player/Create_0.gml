/// @description Initialize variables
hp = 3;
hitby = noone;

gamepad_set_axis_deadzone(0, 0.5);

actor_init_move(3);
actor_init_jump(-50, 50);
actor_init_attack([1, 2, 2, 3, 2], [true, true, false, false, false])
actor_set_depth();