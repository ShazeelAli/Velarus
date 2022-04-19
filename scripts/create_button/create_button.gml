// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_button(_x,_y,_width,_height,_text,_script,_script_args,_base_color,_hover_color,_font_color){
	
	var _button = instance_create_layer(_x,_y,"Instances",obj_NonGUI_button)
	
	with(_button)
	{
		width = _width;
		height = _height;
		text = _text;
		if(_script != -1)
		{
			button_script_activate = 0;
		}
		button_script = _script;
		button_script_args = _script_args
		button_base_color = _base_color
		button_hover_color = _hover_color
		button_font_color = _font_color
	}
}