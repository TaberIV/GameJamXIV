/// @description Game control

if (keyboard_check_pressed(vk_f1))
	global.debug = !global.debug;
	
if (keyboard_check_pressed(ord("R")))
	room_restart();

if (keyboard_check_pressed(vk_escape))
	game_end();
	
if (room == rm_training and ((keyboard_check_pressed(vk_enter) and !keyboard_check(vk_alt)) 
		or gamepad_button_check_released(0, gp_start)))
	room_goto_next();