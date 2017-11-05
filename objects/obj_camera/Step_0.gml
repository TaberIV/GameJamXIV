/// @description Lerp towards player

x = lerp(x, obj_player.x, lerp_val);
y = lerp(y, obj_player.y - sprite_get_height(obj_player.mask_index) / 2 + obj_player.height, lerp_val);