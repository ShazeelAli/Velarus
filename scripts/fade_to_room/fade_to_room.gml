// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fade_to_room(to_room, fade_duration, fade_colour){
	
	var _fade_instance = instance_create_layer(0,0,"Instances",obj_fade_transition)
	with(_fade_instance)
	{
		targetRoom = to_room;
		duration = fade_duration;
		color = fade_colour;
	}
}