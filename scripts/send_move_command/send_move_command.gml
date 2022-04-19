// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_move_command(axis, given_direction){
	var _t_buffer = buffer_create(1024,buffer_fixed,1)
	buffer_seek(_t_buffer,buffer_seek_start, 0);
	buffer_write(_t_buffer,buffer_u8, Network.move)
	buffer_write(_t_buffer,buffer_u8, socket)
	buffer_write(_t_buffer,buffer_u8, axis)
	buffer_write(_t_buffer,buffer_s8,given_direction)
	network_send_packet(obj_con_client.client, _t_buffer, buffer_tell(_t_buffer));
	buffer_delete(_t_buffer)
			
	var _player = ds_map_find_value(obj_con_client.sockets_to_playerInstance, socket)
	if(_player)
	{
		if(!_player.is_server_player)
		{
			var _facing_direction_up_down = _player.move_up_down;
			var _facing_direction_left_right = _player.move_left_right;
			
			if (axis = Move.Left_Right)
			{	
				_player.move_left_right += given_direction
				_player.x_axis_move = true
				_player.y_axis_move = false
				if(_player.move_left_right == 0 && _player.move_up_down != 0)
				{
					_player.x_axis_move = false
					_player.y_axis_move = true
				}
			}
			
			if(axis = Move.Up_Down)
			{
				_player.move_up_down += given_direction
				
				_player.y_axis_move = true
				_player.x_axis_move = false
				if(_player.move_left_right != 0 && _player.move_up_down == 0)
				{
					_player.y_axis_move = false
					_player.x_axis_move = true
				}
			}
			
			if(_player.x_axis_move){
				if(sign(_player.move_left_right) == -1)
				{
					_player.sprite_index = spr_walk_left_pistol
					_player.facing = "left"
				}
				else if(sign(_player.move_left_right) == 1)
				{
					_player.sprite_index = spr_walk_right_pistol
					_player.facing = "right"
				}
			}
			else if(_player.y_axis_move)
			{
				if(sign(_player.move_up_down) == -1)
				{
					_player.sprite_index = spr_walk_up_pistol
					_player.facing = "up"
				}
				else if(sign(_player.move_up_down) == 1)
				{
					_player.sprite_index = spr_walk_down_pistol
					_player.facing = "down"
				}
			}
			
			if(!_player.y_axis_move && !_player.x_axis_move)
			{
				if(_player.facing == "up")
				{
					_player.sprite_index = spr_idle_up_pistol
				}
				else if(_player.facing == "down")
				{
					_player.sprite_index = spr_idle_down_pistol
				}
				else if(_player.facing == "left")
				{
					_player.sprite_index = spr_idle_left_pistol
				}
				else if(_player.facing == "right")
				{
					_player.sprite_index = spr_idle_right_pistol
				}
			}
		}
		
		
	}

}