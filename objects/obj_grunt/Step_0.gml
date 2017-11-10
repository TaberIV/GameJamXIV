/// @description Process enemy

actor_jump();
actor_move();

if (action != HIT_STUN and (distance_to_object(obj_player) <= attack_radius and random(1) > .9) or action == ATTACK) {
	action = ATTACK;
	attack_num = 0;
}

actor_attack();

enemy_check_hit();