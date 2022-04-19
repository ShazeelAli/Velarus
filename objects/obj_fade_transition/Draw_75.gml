var _gui_width = display_get_gui_width()
var _gui_height = display_get_gui_height()

draw_set_alpha(alpha)
draw_set_color(color)

draw_rectangle(0,0,_gui_width,_gui_height,0)

draw_set_alpha(1)
draw_set_color(c_white)