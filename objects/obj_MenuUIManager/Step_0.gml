var _x = camera_get_view_x(ui_camera)
var _y =  camera_get_view_y(ui_camera)

// Move Camera To Chosen Menu
var _lerp_x = lerp(_x,toXpos,0.1)
var _lerp_y = lerp(_y,toYpos,0.1)

camera_set_view_pos(ui_camera,_lerp_x,_lerp_y)


// Move Parallax Backgrounds
var _b = ds_map_find_first(background_map);
repeat(ds_map_size(background_map))
{
	layer_x(_b, background_map[? _b] * _lerp_x);
	_b = ds_map_find_next(background_map, _b);
}


// Input Box
if(toXpos == 4 * display_get_gui_width())
{	
	if(string_length(keyboard_string) <= ip_input_limit)
	{
		ip_input = keyboard_string 
	}
	else
	{
		keyboard_string = ip_input
	}
	
}

// Input Box
if(toXpos == 2 * display_get_gui_width())
{	
	if(string_length(keyboard_string) <= name_input_limit)
	{
		name_input = keyboard_string 
	}
	else
	{
		keyboard_string = ip_input
	}
	
}

