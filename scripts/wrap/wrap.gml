/// @description Wrap(value, min, max)
/// @function Wrap
/// @param val
/// @param min
/// @param max
// Returns the value wrapped, values over or under will be wrapped around
var val = argument0;
var minumum = argument1;
var maximum = argument2;

if (val mod 1 == 0)
{
    while (val > maximum || val < minumum)
    {
        if (val > maximum)
            val += minumum - maximum - 1;
        else if (val < minumum)
            val += maximum - minumum + 1;
    }
    return(val);
}
else
{
    var vOld = val + 1;
    while (val != vOld)
    {
        vOld = val;
        if (val < minumum)
            val = maximum - (minumum - val);
        else if (val > maximum)
            val = minumum + (val - maximum);
    }
    return(val);
}