/// @description Initialize variables

gamepad_set_axis_deadzone(0, 0.5);

// Set depth
depth = -y;

// Movement
move_speed = 3;
move_override = false;

// Jump
ground = 0;
var jump_height = -50;
var jump_width = 50;

z_velocity = 0;
grounded = true;

jump_speed = 2 * jump_height * move_speed / jump_width;
jump_grav = -2 * jump_height * sqr(move_speed) / sqr(jump_width);
height = 0;

// Attacks
hit = false;
attack_active_frame = [1, 2, 2, 3, 2];
attack_cancelable = [true, true, false, true];
air_attack_charge = true;

// Actions
#macro NONE 0
#macro MOVE 1
#macro BLOCK 2
#macro ATTACK 3

action = NONE;