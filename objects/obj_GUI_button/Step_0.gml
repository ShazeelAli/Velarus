var _hover = get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left)

hover = lerp(hover, _hover, 0.1);

if(_click && button_script_activate >= 0)
{
	ScriptExecuteArray(button_script,button_script_args)
}