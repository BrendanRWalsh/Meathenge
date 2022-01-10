/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,0,x,y,1,1,dir,c_white,0.9)
_xx = x + lengthdir_x(50,dir)
_yy = y + lengthdir_y(50,dir)
draw_line(x,y,_xx,_yy)