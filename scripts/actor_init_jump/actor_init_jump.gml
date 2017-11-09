/// @description Initizalize jump variables
/// @param jump_height
/// @param jump_width

var jump_height = argument0;
var jump_width = argument1;

z_velocity = 0;
height = 0;
ground = 0;
grounded = ground == height;

jump_speed = 2 * jump_height * move_speed / jump_width;
jump_grav = -2 * jump_height * sqr(move_speed) / sqr(jump_width);