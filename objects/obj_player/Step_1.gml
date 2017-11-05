/// @description Get input

// Set depth
depth = -y - ground;

// Movement
move_input = [0, 0];
move_input[0] = gamepad_axis_value(0, gp_axislh);
move_input[1] = gamepad_axis_value(0, gp_axislv);
normalize(move_input);

#region Action Processing
// Buttons
jump_pressed = gamepad_button_check_pressed(0, gp_face1);
attack_weak_pressed = gamepad_button_check_pressed(0, gp_face3);
attack_strong_pressed = gamepad_button_check_pressed(0, gp_face4);
block_down = gamepad_button_check(0, gp_shoulderrb);

action = NONE;

// Move
if (move_input[0] != 0 or move_input[1] != 0)
	action = MOVE;

// Block
if (block_down and grounded)
	action = BLOCK;

// Attack
var attacking = (sprite_index == spr_player_attack_weak1) and (image_index != 0);
if (attack_weak_pressed or attacking and grounded) {
	action = ATTACK;
}
#endregion