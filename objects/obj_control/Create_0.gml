/// @description Initialize globals and macros

global.debug = false;

instance_create_depth(0, 0, -1000, obj_camera);

// Actions
#macro HIT_STUN -1
#macro NONE 0
#macro MOVE 1
#macro BLOCK 2
#macro ATTACK 3