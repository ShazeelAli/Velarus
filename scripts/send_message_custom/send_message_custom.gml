// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_message_custom(){
	
	var data = ""
	
	for (var i = 0; i < argument_count; i++)
	{
		data += json_stringify(argument[i]) //+ "=::="
	}
	data = "XSTART" + data + "XENDX"
	
	var _buffer = buffer_create(string_byte_length(data),buffer_fixed,1)
	buffer_seek(_buffer, buffer_seek_start,0);
	buffer_write(_buffer,buffer_text,data)
	network_send_raw(global.socket,_buffer,buffer_get_size(_buffer));
	buffer_delete(_buffer)
}