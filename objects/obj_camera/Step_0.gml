/// @description Lerp towards player

var x_offset = 100 * sign(obj_player.image_xscale);
var y_offset = -sprite_get_height(obj_player.mask_index) / 2 + obj_player.height;

x = lerp(x, obj_player.x + x_offset, lerp_val);
y = lerp(y, obj_player.y + y_offset, lerp_val);