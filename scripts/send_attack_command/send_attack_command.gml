// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_attack_command(axis, given_direction){
	var _t_buffer = buffer_create(1024,buffer_fixed,1)
	buffer_seek(_t_buffer,buffer_seek_start, 0);
	buffer_write(_t_buffer,buffer_u8, Network.attack)
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
			if(_player.attack_speed_cooldown_remaining > 0){return}
			_player.attack_speed_cooldown_remaining = _player.attack_speed_cooldown
			_player.currently_attacking = true;
			if (axis = Move.Left_Right)
				{	
					if(sign(given_direction) == 1)
					{

						_player.sprite_index = spr_shoot_right_pistol
						_player.facing = "right"
					}
					else
					{

						_player.sprite_index = spr_shoot_left_pistol
						_player.facing = "left"
					}
				}
			
				if(axis = Move.Up_Down)
				{
					if(sign(given_direction) == 1)
					{

						_player.sprite_index = spr_shoot_down_pistol
						_player.facing = "down"
					}
					else
					{

						_player.sprite_index = spr_shoot_up_pistol
						_player.facing = "up"
					}
				}
				_player.image_index = 0
		}
	}
}