/// @description Game control

if (keyboard_check_pressed(vk_f1))
	global.debug = !global.debug;

if (keyboard_check_pressed(vk_escape))
	game_end();