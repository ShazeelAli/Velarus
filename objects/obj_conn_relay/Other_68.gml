var type = ds_map_find_value(async_load, "type");      
switch(type){
	//case network_type_connect:                                                        
		//var sock = ds_map_find_value(async_load, "socket"); 
		//ds_list_add(socketlist, sock);  
	case network_type_data:
		
		// get buffer data
		var buffer = async_load[? "buffer"];
		var str = buffer_read(buffer, buffer_string);
		show_debug_message(str)
		// if we have a start header start appending any data
		if (string_pos("XSTART", str) == 1) {
			if (start_stream == false) {
			start_stream = true;
			data_stream += str;
			

			} 
		}
		else if (start_stream == true) {
		data_stream += str;
		}



		// once we have an end header try splitting the data
		if (string_pos("XENDX", data_stream) != -1) 
		{	
			// split data based on start + end headers
			var splits = string_split(data_stream, "XENDX", []);
			
			for (var s = 0; s < ds_list_size(splits); s++) 
			{
				var split = ds_list_find_value(splits,s);
				if (split !="") 
				{
					// snip off the end header from string
					var position = string_pos("XSTART", split);
					var plen = string_length(split)-position+1;
					var postcursor = string_replace(string_copy(split, position, plen), "XSTART", "");
			
					try
					{
						var json = json_parse(postcursor)
						show_debug_message(json)
						received_packet(json.code,json)
					}
					catch (ex)
					{
						show_debug_message("Incomplete Buffer, Waiting fro next Packet" + ex.longMessage)
					}
				}
			}
		}
		// keep going if more
		if (array_length(splits) > 0 && splits[array_length(splits)-1] != "") 
		{
			data_stream = splits[array_length(splits)-1];
		}
		else {

			data_stream = "";
			start_stream = false;

		}
		break;
		
		case network_type_non_blocking_connect:
			var succeeded = async_load[? "succeeded"];
		    if succeeded = 0 
			{
		     with(obj_MenuUIManager){proxy_connect_message = "Connection Failed, Please restart game, if that does not work contact support"}
			 network_destroy(global.socket)
			 instance_destroy()
			 
		    } 
			else {
				with(obj_MenuUIManager){proxy_connect_message = "Connection Successful!"}
				menu_change("Name")
				
		    }
		    break;

}
 
