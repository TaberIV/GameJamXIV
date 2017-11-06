/// @description Draw self

// Draw drop shadow
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_ellipse(bbox_left, bbox_bottom - 2 - ground, bbox_right, bbox_bottom + 2 - ground, false);
draw_set_alpha(1);

// Draw self
draw_sprite_ext(sprite_index, -1, x, y + height, image_xscale, image_yscale, 0, c_white, 1);

// Draw hitbox
if (global.debug) {
	draw_set_color(c_lime);
	draw_set_alpha(.5);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	draw_set_alpha(1);
}