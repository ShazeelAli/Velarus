// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function string_split(){
	var s = argument[0], d = argument[1];
	var r = ds_list_create();
	var p = string_pos(d, s);
	var dl = string_length(d);
	if (dl) while (p) {
	    p -= 1;
	    ds_list_add(r, string_copy(s, 1, p));
	    s = string_delete(s, 1, p + dl);
	    p = string_pos(d, s);
		
	}
	ds_list_add(r, s);
	return r;
}