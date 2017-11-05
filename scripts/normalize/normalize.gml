/// @description Normalize a 2 dim vector
/// @param vector2
vector = argument0;

mag = sqrt(sqr(vector[0]) + sqr(vector[1]));

vector[@ 0] = vector[0] / mag;
vector[@ 1] = vector[1] / mag;