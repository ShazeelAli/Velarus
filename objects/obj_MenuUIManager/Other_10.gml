/// @description Create all Buttons

var _gui_height = display_get_gui_height()
var _gui_width = display_get_gui_width()
var button_height = _gui_height * 0.2
var button_width = _gui_width * 0.3
var y_padding = 20

// Main Menu
create_button(_gui_width/2 - button_width/2,_gui_height/4,button_width,button_height,"Play",menu_change,["ProxyConnect"],#98633B,#DEB886,#42291A)
create_button(_gui_width/2- button_width/2,_gui_height/4 + button_height + y_padding ,button_width,button_height,"Options",menu_change,["Options"],#98633B,#DEB886,#42291A)
create_button(_gui_width/2- button_width/2,_gui_height/4 + (2 *button_height) + (2 * y_padding) ,button_width,button_height,"Exit",menu_change,["Exit"],#98633B,#DEB886,#42291A)

// Name Entry Area
create_button(2 * _gui_width + _gui_width/2 - button_width/2,_gui_height/4 + button_height + y_padding,button_width,button_height,"Continue",menu_change,["Play"],#98633B,#DEB886,#42291A)

// Game Play Menu
create_button(3 *_gui_width + _gui_width/2 - button_width/2,_gui_height/4,button_width,button_height,"Host",menu_change,["Hosting"],#98633B,#DEB886,#42291A)
create_button(3 *_gui_width + _gui_width/2 - button_width/2,_gui_height/4 + button_height + y_padding,button_width,button_height,"Join",menu_change,["Join"],#98633B,#DEB886,#42291A)
create_button(3 *_gui_width + _gui_width/2- button_width/2,_gui_height/4 + (2 *button_height) + (2 * y_padding) ,button_width,button_height,"Back",menu_change,["Name"],#98633B,#DEB886,#42291A)

// Join Menu
create_button(4 * _gui_width + _gui_width/2 - button_width/2,_gui_height/4 + button_height + y_padding,button_width,button_height,"Join",menu_change,["Connecting"],#98633B,#DEB886,#42291A)
create_button(4 * _gui_width + _gui_width/2- button_width/2,_gui_height/4 + (2 *button_height) + (2 * y_padding) ,button_width,button_height,"Back",menu_change,["Play"],#98633B,#DEB886,#42291A)

// Cancel Connecting Button
create_button(5 * _gui_width + _gui_width/2- button_width/2,_gui_height/4 + (2 *button_height) + (2 * y_padding) ,button_width,button_height,"Cancel",menu_change,["Cancel"],#98633B,#DEB886,#42291A)

create_button(7 * _gui_width - (button_width + 20),_gui_height*0.75 ,button_width,button_height/2,"Leave",menu_change,["Leave"],#98633B,#DEB886,#42291A)
