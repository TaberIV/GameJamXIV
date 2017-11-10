/// @description Draw num lives

if (room != rm_training) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_press_start);
	draw_set_color(c_black);
	
	draw_text(15, 15, "HP: " + string(hp));
}