/// @description Initialize variables

// Movement
move_speed = 3;

// Jump
ground = 0;
var jump_height = -50;
var jump_width = 50;

jump_vel = 0;
jump_speed = 2 * jump_height * move_speed / jump_width;
jump_grav = -2 * jump_height * sqr(move_speed) / sqr(jump_width);
height = 0;

// Actions
#macro NONE 0
#macro MOVE 1
#macro BLOCK 2
#macro ATTACK 3

action = NONE;