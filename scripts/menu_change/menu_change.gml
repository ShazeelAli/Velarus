// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function menu_change(_to_menu){
	
	switch(_to_menu)
	{
		// Main Menu
		case "Main":
			with(obj_MenuUIManager)
			{
				toXpos = 0;
				toYpos = 0;
			}
			break;
		// Play Menu
		case "ProxyConnect":
			if(!instance_exists(obj_conn_relay))
			{
				instance_create_layer(0,0,"Instances",obj_conn_relay)
			}
			with(obj_MenuUIManager)
			{
				proxy_connect_message = "Connecting"
				toXpos = display_get_gui_width();
				toYpos = 0;
			}
			break;
		
		case "Name":
			
			with(obj_MenuUIManager)
			{
				keyboard_string = name_input
				toXpos = 2 * display_get_gui_width();
				toYpos = 0;
			}
			break;
			
		case "Play":
			with(obj_MenuUIManager)
			{
				
				toXpos = 3 * display_get_gui_width();
				toYpos = 0;
			}
			break;
		//Join Menu
		case "Join":
			with(obj_MenuUIManager)
			{
				keyboard_string = ip_input
				toXpos = 4 * display_get_gui_width();
				toYpos = 0;
			}
			break;
		// Async Connect Screen
		case "Connecting":
			with(obj_MenuUIManager)
			{
				
				var _msg = {code: "JOINHOST",
							room_code:ip_input,
							player_name:name_input
							}
				send_message_custom(_msg)
				host_join_message = "Connecting"
				toXpos = 5 * display_get_gui_width();
				toYpos = 0;
				
				
			}
			break;
		case "Hosting":
			//instance_create_layer(0,0,"Instances",obj_con_server)
			with(obj_MenuUIManager)
			{
				host_join_message = "Creating Lobby"
				obj_conn_relay.Host = 
				{
					player_name:name_input,
				}
				toXpos = 5 * display_get_gui_width();
				toYpos = 0;
				var _msg = {code:"HOST",
						player_name:name_input}
				send_message_custom(_msg)
			}
			
			
			break;
			
		case "HostSuccess":
		
			with(obj_MenuUIManager)
			{	
				host_join_message = "Lobby Created"
				toXpos = 6 * display_get_gui_width();
				toYpos = 0;
			}
			break;
			
		case "ConnectionSuccess":
			with(obj_MenuUIManager)
			{	
				host_join_message = "Connected"
				toXpos = 6 * display_get_gui_width();
				toYpos = 0;
			}
			break;
		
		case "Leave":
			var _msg = 
			{
				code:"DISCONNECT"
			}
			send_message_custom(_msg)
			with(obj_MenuUIManager)
			{	
				host_join_message = "Connected"
				toXpos = 3 * display_get_gui_width();
				toYpos = 0;
			}
			
			
	}
	
}	