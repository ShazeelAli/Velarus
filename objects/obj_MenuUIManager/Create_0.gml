// Camera Setup
ui_camera = view_get_camera(0)
toXpos = 0;
toYpos = 0;

// Text Setup
ip_input = ""
ip_input_limit = 14
name_input = ""
name_input_limit = 14
cursor = "|";
delay = 20;
alarm[0] = delay;

host_join_message = ""
proxy_connect_message = ""
ellipses = ""
alarm[1] = delay

//Parallax Map Setup
background_map = ds_map_create();
background_map[? layer_get_id("Parallax_Background")] = 0.98;
background_map[? layer_get_id("Parallax_Mountain_far")] = 0.8;
background_map[? layer_get_id("Parallax_Mountain_close")] = 0.1;
background_map[? layer_get_id("Parallax_Mountains_trees")] = 0;
background_map[? layer_get_id("Parallax_Fg_trees")] = -0.5;

//Set up menu buttons
event_user(0)

