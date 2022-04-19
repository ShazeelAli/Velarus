// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_collision(){
	var _collision = false;
	var centre_y = (bbox_bottom + bbox_top)/2
	var centre_x = (bbox_right + bbox_left)/2
	var collision_layer = layer_get_id("Collision");
	var collision_map = layer_tilemap_get_id(collision_layer);
	var _temp_speed_x = move_left_right;
	var _temp_speed_y = move_up_down;
	
	// Horizontal Tiles
	if (tilemap_get_at_pixel(collision_map, centre_x + move_left_right, centre_y))
	{
		centre_x -= centre_x mod 16;
		if (sign(move_left_right) == 1) centre_x += 16 - 1;
		_temp_speed_x = 0;
		_collision = true;
		
	}
	
	// Vertical Tiles
	if (tilemap_get_at_pixel(collision_map, centre_x, centre_y + move_up_down))
	{
		centre_y -= centre_y mod 16;
		if (sign(move_up_down) == 1) centre_y += 16 - 1;
		_temp_speed_y = 0;
		_collision = true;
		
	}
	
	// Collision with entities
	/*
	check_entity_x = instance_position(centre_x+move_left_right, centre_y, par_entity);
	
	if(check_entity_x) 
	{	
		
		move_left_right=0
		_collision = true;
	}
	
	check_entity_y =instance_position(x, centre_y+move_up_down, par_entity)
	if(check_entity_y){
		
		if(centre_y + move_up_down <= check_entity_y.bbox_bottom && centre_y + move_up_down >= check_entity_y.bbox_top)
		{	
			
			move_up_down=0;
			_collision = true;
		}
	}
	*/
	
	if(x_axis_move){
	x += _temp_speed_x
	}
	else{
	y += _temp_speed_y
	}
	
	return _collision
}