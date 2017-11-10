/// @description follows player
/// @param range

var range = argument0;


if (distance_to_object(obj_player) < range and ground == obj_player.ground
			and distance_to_object(obj_player) > attack_radius)
	move_input = [obj_player.x - x, obj_player.y - y];
else if ((distance_to_object(obj_player) >= range or ground != obj_player.ground)
			and distance_to_point(xstart, ystart) > 3){
	move_input = [xstart - x, ystart - y];
	}
else
	move_input = [0, 0];
if (move_input[0] != 0)
	image_xscale = sign(move_input[0]);
	
normalize(move_input);