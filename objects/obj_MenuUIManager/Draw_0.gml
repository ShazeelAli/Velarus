var _gui_height = display_get_gui_height()
var _gui_width = display_get_gui_width()
var button_height = _gui_height * 0.2
var button_width = _gui_width * 0.3
//var y_padding = 20



draw_set_valign(fa_middle)
draw_set_font(FantasyFontBig)
// Code Entry Box Display
draw_sprite_stretched(spr_textbox, 0,4 * _gui_width + _gui_width/2 - button_width/2 ,_gui_height/4,button_width,button_height);
if(string_length(ip_input) != 0)
{
	draw_set_color(#583828)
	draw_text(4 * _gui_width + _gui_width/2 - button_width/2 + 40,_gui_height/4 + button_height/2,ip_input + cursor)
}
else
{
	draw_set_color(#dcdcdc)
	draw_text(4 * _gui_width + _gui_width/2 - button_width/2 + 40,_gui_height/4 + button_height/2,cursor + "Enter Code...")
}

// Name Input Display
draw_sprite_stretched(spr_textbox, 0,2 * _gui_width + _gui_width/2 - button_width/2 ,_gui_height/4,button_width,button_height);
if(string_length(name_input) != 0)
{
	draw_set_color(#583828)
	draw_text(2 * _gui_width + _gui_width/2 - button_width/2 + 40,_gui_height/4 + button_height/2,name_input + cursor)
}
else
{
	draw_set_color(#dcdcdc)
	draw_text(2 * _gui_width + _gui_width/2 - button_width/2 + 40,_gui_height/4 + button_height/2,cursor + "Enter Name...")
}

// Connection Messages
draw_set_color(#583828)
draw_set_halign(fa_middle)
if(host_join_message == "Connecting")
{
	draw_text(5 * _gui_width + _gui_width/2,_gui_height/2,host_join_message + ellipses)
}
else
{
	draw_text(5 * _gui_width + _gui_width/2,_gui_height/2,host_join_message)
}

if(proxy_connect_message == "Connecting")
{
	draw_text( _gui_width + _gui_width/2,_gui_height/2,proxy_connect_message + ellipses)
}
else
{
	draw_text_ext( _gui_width + _gui_width/2,_gui_height/2,proxy_connect_message,40,1366)
}

if(instance_exists(obj_conn_relay)){

	draw_sprite_stretched(spr_textbox, 0,6 * _gui_width + _gui_width/2 - button_width/2 ,50,button_width,button_height * 4);
	if(obj_conn_relay.Host != "")
	{
		draw_text(6 * _gui_width + _gui_width/2,80,obj_conn_relay.Host.player_name)
	}
	for(var i = 0; i < array_length(obj_conn_relay.clients_connected); i++)
	{	
		var _player_data = variable_struct_get(obj_conn_relay.clients_connected_data,obj_conn_relay.clients_connected[i])
		draw_text(6 * _gui_width + _gui_width/2,110 + (30 * i),_player_data.player_name)
	}
	draw_sprite_stretched(spr_textbox, 0,6 * _gui_width + 20,_gui_height/2 - button_height/2,button_width,button_height);
	draw_set_halign(fa_left)
	draw_text(6 * _gui_width + 50, _gui_height/2, "Code: "+obj_conn_relay.room_code)
}











