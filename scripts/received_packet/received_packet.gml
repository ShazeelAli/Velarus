// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function received_packet(code,json){

	switch(code)
	{
		case "HOST_SUCCESS":
			menu_change("HostSuccess")
			obj_conn_relay.room_code = json.room_code
			
			break;
		case "JOIN_SUCCESS":
			menu_change("ConnectionSuccess")
			obj_conn_relay.room_code = json.room_code
			break;
		case "PLAYER_JOINED":
			var _player_data = {player_name:json.player_name}
			variable_struct_set(obj_conn_relay.clients_connected_data,string(json.client_id),_player_data)
			array_push(obj_conn_relay.clients_connected,json.client_id)
			
			
			
			var _msg = 
			{
				code: "SYNC",
				sync_code: "PLAYERS_DATA",
				room_code:obj_conn_relay.room_code,
				host:obj_conn_relay.Host,
				players_connected_id:clients_connected,
				players_connected_data: clients_connected_data
			}
			send_message_custom(_msg)
			break;
		
		case "DISCONNECT":
			obj_conn_relay.clients_connected = []
			obj_conn_relay.clients_connected_data = {}
			obj_conn_relay.Host = ""
			menu_change("Play")
		
		case "REMOVE_PLAYER":
			for(var i =0; i < array_length(obj_conn_relay.clients_connected); i++)
			{
				if(obj_conn_relay.clients_connected[i] == json.client_id)
				{
					array_delete(obj_conn_relay.clients_connected,i,1)
					break;
				}
			}
			variable_struct_remove(obj_conn_relay.clients_connected_data,json.client_id)
			var _msg = 
			{
				code: "SYNC",
				sync_code: "PLAYERS_DATA",
				room_code:obj_conn_relay.room_code,
				host:obj_conn_relay.Host,
				players_connected_id:clients_connected,
				players_connected_data: clients_connected_data
			}
			send_message_custom(_msg)
			break;
			
		
		case "SYNC":
		
			switch(json.sync_code)
			{
				case "PLAYERS_DATA":
					obj_conn_relay.Host = json.host
					obj_conn_relay.clients_connected = json.players_connected_id;
					obj_conn_relay.clients_connected_data = json.players_connected_data;
			}
			
	}
}
