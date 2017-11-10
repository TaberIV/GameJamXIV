/// @description Draw GUI

if (room == rm_training) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_press_start);
	draw_set_color(c_black);
	
	draw_text(room_width / 2, room_height / 4, "Press Start to Continue");
}