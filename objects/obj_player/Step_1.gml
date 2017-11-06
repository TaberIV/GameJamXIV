/// @description Get input

// Set depth
depth = -y - ground;

// Movement
move_input = [0, 0];
move_input[0] = gamepad_axis_value(0, gp_axislh);
move_input[1] = gamepad_axis_value(0, gp_axislv);
normalize(move_input);

move_override = false;

#region Action Processing
// Buttons
jump_pressed = gamepad_button_check_pressed(0, gp_face1);

var attack_weak_pressed = gamepad_button_check_pressed(0, gp_face3);
var attack_strong_pressed = gamepad_button_check_pressed(0, gp_face4);

block_down = gamepad_button_check(0, gp_shoulderrb);

action = NONE;

// Move
if (move_input[0] != 0 or move_input[1] != 0)
	action = MOVE;

// Block
if (block_down and grounded)
	action = BLOCK;

#region Attack
var attack_pressed = attack_weak_pressed || attack_strong_pressed;
var spr_name = sprite_get_name(sprite_index);
var attacking = string_pos("attack", spr_name) != 0 and image_index != 0;
air_attack_charge |= grounded or hit;

if ((attack_pressed and (grounded or air_attack_charge)) or attacking) {
	action = ATTACK;
	
	if (attacking) {
		var len = string_length(spr_name);
		attack_num = int64(string_char_at(spr_name, len));
	} else
		attack_num = 0;
	
	if (!(attacking or grounded) or (attacking and string_pos("air", spr_name) != 0)) {
		attack_num = 4;
		air_attack_charge = false;
	}
	
	// Starts new attack
	cancel = image_index >= attack_active_frame[attack_num];
	hit = hit and cancel;
	if (attacking and attack_weak_pressed and attack_num < 2 and cancel) {
		if (attack_cancelable[attack_num] and (attack_num != 1 or move_input[0] == image_xscale))
			attack_num++;
	}
	
	#region Attack special effects
	switch (attack_num) {
		case 2:
			if (image_index > 1 and image_index < 4) {
				move_input[0] = image_xscale * 1.5;
				move_input[1] = 0;
				move_override = true;
			
				if (image_index == 2) {
					z_velocity = -2;
					height += z_velocity;
				}
				
				if (height < -ground)
					image_index = clamp(image_index, 0, 2.75);
				
			} else if (image_index == 4 and move_input[0] == image_xscale)
				action = MOVE;
			break;
		case 4:
			z_velocity = clamp(z_velocity, -999, 0);
			break;
	}
	#endregion
}
#endregion
#endregion