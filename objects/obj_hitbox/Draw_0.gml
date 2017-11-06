/// @description Delete self at end of frame

if (global.debug) {
	draw_sprite_ext(sprite_index, -1 , x, y, image_xscale, image_yscale, 0, c_white, 0.5);
}

instance_destroy();